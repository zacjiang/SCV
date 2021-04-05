#!/bin/bash
python -u train.py --name scv-chairs --stage chairs --validation chairs --output outputs/chairs --num_steps 120000 --lr 0.00025 --image_size 368 496 --wdecay 0.0001 --gpus 0 1 --num_k 8 --batch_size 6 --iters 8 --val_freq 10000 --print_freq 100 

python -u train.py --name scv-things --stage things --validation sintel --output outputs/things --num_steps 120000 --lr 0.0001 --image_size 400 720 --wdecay 0.0001 --gpus 0 1 --num_k 8 --batch_size 4 --iters 8 --val_freq 10000 --print_freq 100 --checkpoint outputs/chairs/scv-chairs.pth

python -u train.py --name scv-sintel --stage sintel --validation sintel --output outputs/sintel --num_steps 120000 --lr 0.00025 --image_size 368 768 --wdecay 0.0001 --gpus 0 1 --num_k 8 --batch_size 4 --iters 8 --val_freq 10000 --print_freq 100 --checkpoint outputs/things/scv-things.pth

python -u train.py --name scv-kitti --stage kitti --validation kitti --output outputs/kitti --num_steps 120000 --lr 0.00025 --image_size 288 960 --wdecay 0.0001 --gpus 0 1 --num_k 8 --batch_size 4 --iters 8 --val_freq 10000 --print_freq 100 --checkpoint outputs/sintel/scv-sintel.pth
