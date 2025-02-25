#!/bin/bash


mkdir /content/checkpoint && cp /content/drive/MyDrive/pre_train_model.pth.tar /content/checkpoint/pre_train_model.pth.tar 


LR=0.01
BATCH_SIZE=16
EPOCHS=5
SOURCE_NAME="webcam"
SOURCE_PATH="RASC_wData/data/office31/webcam.txt" 
TARGET_NAME="amazon"
TARGET_PATH="RASC_wData/data/office31/amazon.txt"
CLASS_NUM=31



alpha=(0.1,0.3,0.5,0.7,0.9)

for a in "${alpha[@]}"; do
    OUTPUT_FILE="training_budget_${a}.txt"
    echo "Running training with alpha=${a}, output -> ${OUTPUT_FILE}"

    python3 main.py --lr ${LR} \
                    --batch-size ${BATCH_SIZE} \
                    --epochs ${EPOCHS} \
                    --s ${SOURCE_NAME} \
                    --source ${SOURCE_PATH} \
                    --t ${TARGET_NAME} \
                    --target ${TARGET_PATH} \
                    --target-val ${TARGET_PATH} \
                    --class-num ${CLASS_NUM} \
                    --cont-loss-weight1 ${a} > "${OUTPUT_FILE}" 2>&1
		    
                    
done



beta=(0.1,0.3,0.5,0.7,0.9)

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

echo "All training runs completed!"








