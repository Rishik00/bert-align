#!/bin/bash

# === USAGE CHECK ===
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <data_file> <output_file>"
    echo "Example: $0 /content/input.txt /content/output.txt"
    exit 1
fi

# === CONFIGURATION ===
DATA_FILE=$1
OUTPUT_FILE=$2
MODEL_NAME_OR_PATH="bert-base-multilingual-cased"
BATCH_SIZE=32
EXTRACTION="softmax"

# === INFO ===
echo "🔧 Running Awesome-Align:"
echo "  📄 Input File  : $DATA_FILE"
echo "  📤 Output File : $OUTPUT_FILE"
echo "  🤖 Model       : $MODEL_NAME_OR_PATH"
echo "  ⚙️ Extraction  : $EXTRACTION"
echo "  📦 Batch Size  : $BATCH_SIZE"

# === RUN AWESOME-ALIGN ===
CUDA_VISIBLE_DEVICES=0 awesome-align \
    --output_file "$OUTPUT_FILE" \
    --model_name_or_path "$MODEL_NAME_OR_PATH" \
    --tokenizer_name "$MODEL_NAME_OR_PATH" \
    --data_file "$DATA_FILE" \
    --extraction "$EXTRACTION" \
    --batch_size "$BATCH_SIZE"
