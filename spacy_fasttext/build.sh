. activate texta-rasa

wget https://dl.fbaipublicfiles.com/fasttext/vectors-crawl/cc.et.300.vec.gz
gzip -d cc.et.300.vec.gz

python load_fasttext.py cc.et.300.vec et

python -m spacy package now_spacy/ .
cd et_model-0.0.0
python setup.py sdist
cd ..
pip install et_model-0.0.0.tar.gz
