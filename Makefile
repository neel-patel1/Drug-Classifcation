

install:
    pip install --upgrade pip &&\
        pip install -r requirements.txt

format:
    black *.py

train:
    python train.py

eval:
    echo "## Model Metrics" > report.md
    cat ./Results/metrics.txt >> report.md
    echo '\n## Confusion Matrix Plot' >> report.md
    echo '![Confusion Matrix](./Results/model_results.png)' >> report.md
    huggingface-cli login --token $HUGGINGFACE_TOKEN --add-to-git-credential
    cml comment create report.md
