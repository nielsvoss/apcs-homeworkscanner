# ocrmypdf has issues packaging, so we need to follow the flags linked here:
# https://github.com/ocrmypdf/OCRmyPDF/issues/659#issuecomment-1517712600
$ghostscriptExecutable = Get-Item $(Get-Command 'gswin64').Source
$ghostscriptFolder = $ghostscriptExecutable.Directory.Parent.FullName
$tesseractFolder = "$env:LOCALAPPDATA\Programs\Tesseract-OCR"
pyinstaller --name 'scanner' `
    --copy-metadata pikepdf --copy-metadata ocrmypdf --collect-submodules ocrmypdf --collect-datas ocrmypdf.data `
    --add-data "$($ghostscriptFolder):ghostscript-program" `
    --add-data "$($tesseractFolder):tesseract-program" `
    main.py
Copy-Item 'README.md' 'dist/scanner/README.md'
Copy-Item 'translate.py' 'dist/scanner/translate.py'
