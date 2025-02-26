#!/bin/bash


mkdir /content/checkpoint && mkdir /content/checkpoint/webcamamazon && cp /content/drive/MyDrive/pre_train_model.pth.tar /content/checkpoint/webcamamazon//pre_train_model.pth.tar


LR=0.01
BATCH_SIZE=16
EPOCHS=10
SOURCE_NAME="webcam"
SOURCE_PATH="RASC_wData/data/office31/webcam.txt"
TARGET_NAME="amazon"
TARGET_PATH="RASC_wData/data/office31/amazon.txt"
CLASS_NUM=31



gamma=(0)

for a in "${gamma[@]}"; do
    OUTPUT_FILE="training_gamma_${a}.txt"
    echo "Running training with gamma=${a}, output -> ${OUTPUT_FILE}"

    python3 main.py --lr ${LR} \
                    --batch-size ${BATCH_SIZE} \
                    --epochs ${EPOCHS} \
                    --s ${SOURCE_NAME} \
                    --source ${SOURCE_PATH} \
                    --t ${TARGET_NAME} \
                    --target ${TARGET_PATH} \
                    --target-val ${TARGET_PATH} \
                    --class-num ${CLASS_NUM} \
                    --gamma ${a} > "${OUTPUT_FILE}" 2>&1


done



beta=(0)

for b in "${beta[@]}"; do
    OUTPUT_FILE="training__beta_${b}.txt"
    echo "Running training with beta=${b}, output -> ${OUTPUT_FILE}"

    python3 main.py --lr ${LR} \
                    --batch-size ${BATCH_SIZE} \
                    --epochs ${EPOCHS} \
                    --s ${SOURCE_NAME} \
                    --source ${SOURCE_PATH} \
                    --t ${TARGET_NAME} \
                    --target ${TARGET_PATH} \
                    --target-val ${TARGET_PATH} \
                    --class-num ${CLASS_NUM} \
                    --cont-loss-weight2 ${b} > "${OUTPUT_FILE}" 2>&1


done

python3 main.py --lr ${LR} \
                    --batch-size ${BATCH_SIZE} \
                    --epochs ${EPOCHS} \
                    --s ${SOURCE_NAME} \
                    --source ${SOURCE_PATH} \
                    --t ${TARGET_NAME} \
                    --target ${TARGET_PATH} \
                    --target-val ${TARGET_PATH} \
                    --class-num ${CLASS_NUM} \
                    >  "train_default_RASC.txt" 2>&1






echo "All training runs completed!"




