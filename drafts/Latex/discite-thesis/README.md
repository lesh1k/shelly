# Thesis report made in LaTeX

This thesis is based on the template provided by Sunil Patel,
http://www.sunilpatel.co.uk/thesis-template/
It is adjusted to the standards required by Technical University of Moldova.

To compile the LaTeX files you will need a Tex package.
I recommend Tex Live, it's usually included in the repositories of most
GNU/Linux distributions.
Either you use the Makefile that I removed in a previous commit, or use the
latexmk command. Run:

latexmk -pdf
in the root of the thesis and all files will be compiled as needed in two PDF
files. One for the thesis, another one for the presentation.

Be aware that compiling with pdflatex or latex commands requires you to run them
multiple times, and also to generate the bibliography manually. Just use
latexmk, as it takes care of all the details.

You can add these lines to _.latexmkrc_ :
```bash
$pdf_mode = 1;
$pdf_previewer = "start evince";
$pdf_update_method = 0;
```

This way you won't be required to pass arguments to latexmk.
