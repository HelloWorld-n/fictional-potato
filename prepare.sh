cd $(dirname $0)

curl -fsSL https://pixi.sh/install.sh | sh
pixi init -c https://conda.modular.com/max-nightly/ -c conda-forge
pixi add modular
