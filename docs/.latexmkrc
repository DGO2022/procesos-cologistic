# Natively redirect all auxiliary files to a tmp/ directory
$aux_dir = 'tmp';
# Automate SVG to PDF conversion using rsvg-convert
add_cus_dep('svg', 'pdf', 0, 'svg2pdf');
sub svg2pdf {
    my ($base) = @_;
    print "Auto-converting $base.svg to $base.pdf...\n";
    return system("rsvg-convert -f pdf -o \"$base.pdf\" \"$base.svg\"");
}
