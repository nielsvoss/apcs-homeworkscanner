# ocrmypdf has issues packaging, so we need to follow the flags linked here:
# https://github.com/ocrmypdf/OCRmyPDF/issues/659#issuecomment-1517712600
pyinstaller --copy-metadata pikepdf --copy-metadata ocrmypdf --collect-submodules ocrmypdf --collect-datas ocrmypdf.data main.py
