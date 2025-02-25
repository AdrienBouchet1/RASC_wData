#!/bin/bash

# Définition des paramètres fixes
LR=0.01
BATCH_SIZE=15
EPOCHS=5
SOURCE_NAME="webcam"
SOURCE_PATH="RASC_wData/data/office31/webcam.txt" 
TARGET_NAME="amazon"
TARGET_PATH="RASC_wData/data/office31/amazon.txt"
CLASS_NUM=31

# Liste des valeurs de budget
BUDGET_VALUES=(0.02 0.04 0.06 0.08)

# Boucle pour exécuter la commande avec différentes valeurs de budget
for BUDGET in "${BUDGET_VALUES[@]}"; do
    OUTPUT_FILE="training_budget_${BUDGET}.txt"
    echo "Running training with budget=${BUDGET}, output -> ${OUTPUT_FILE}"

    python3 main.py --lr ${LR} \
                    --batch-size ${BATCH_SIZE} \
                    --epochs ${EPOCHS} \
                    --s ${SOURCE_NAME} \
                    --source ${SOURCE_PATH} \
                    --t ${TARGET_NAME} \
                    --target ${TARGET_PATH} \
                    --target-val ${TARGET_PATH} \
                    --class-num ${CLASS_NUM} \
                    --budget ${BUDGET} > "${OUTPUT_FILE}" 2>&1
done

echo "All training runs completed!"

