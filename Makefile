# Configuration
SRC_DIR      := src
OUT_DIR      := out
TMP_DIR      := tmp
LATEXMK      := latexmk
LATEXMK_FLAGS := -xelatex -output-directory=$(OUT_DIR) -aux-directory=$(TMP_DIR)

# Fichiers LaTeX
TEX_SRCS     := $(wildcard $(SRC_DIR)/*.tex)
PDF_TARGETS  := $(TEX_SRCS:$(SRC_DIR)/%.tex=$(OUT_DIR)/%.pdf)

# Cible par défaut
.DEFAULT_GOAL := help

# Variables globales
export TEXINPUTS := $(SRC_DIR):$(TEXINPUTS):

# Help target
help:
	@echo "Compilation Commands:"
	@echo ""
	@echo "  make [file]      : Compile specific PDF (e.g., 'make cv')"
	@echo "  make all         : Compile all PDFs in src directory"
	@echo "  make watch [file]: Watch and recompile file on changes (e.g., 'make watch cv')"
	@echo "  make clean       : Remove all compiled and temporary files"
	@echo ""
	@echo "Available files:"
	@$(foreach file, $(TEX_SRCS), echo "  - $(basename $(notdir $(file)))";)

# Default target is help
.DEFAULT_GOAL := help

# Primary targets
all: $(PDF_TARGETS)
	@echo "🚀 Compiled all PDFs successfully"

# PDF compilation rule
$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.tex
	@echo "📦 Compiling $*.pdf..."
	$(LATEXMK) $(LATEXMK_FLAGS) $<
	@echo "🚀 $*.pdf created successfully."

# Convenience rules
%: $(OUT_DIR)/%.pdf ;

# Watch mode with no PDF viewer
WATCH_FILE   := $(firstword $(filter-out watch,$(MAKECMDGOALS)))
watch:
	@if [ -z "$(WATCH_FILE)" ] || [ ! -f "$(SRC_DIR)/$(WATCH_FILE).tex" ]; then \
    echo "❌ Error: File '$(WATCH_FILE).tex' was not found in $(SRC_DIR)."; \
    echo "   Available commands:"; \
    $(foreach file, $(TEX_SRCS), echo "   - make watch $(basename $(notdir $(file)))";) \
    exit 1; \
  fi
	@echo "👓 Watching $(SRC_DIR)/$(WATCH_FILE).tex for changes..."
	$(LATEXMK) $(LATEXMK_FLAGS) -view=none -pvc $(SRC_DIR)/$(WATCH_FILE).tex

# Cleanup
clean:
	@rm -rf $(OUT_DIR) $(TMP_DIR)
	@echo "🗑️  Cleaned all compiled and temporary files."

# Phony targets
.PHONY: all clean watch help %

