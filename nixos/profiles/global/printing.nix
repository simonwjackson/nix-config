{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.avahi.enable = true;
  services.avahi.wideArea = false;
  # Important to resolve .local domains of printers, otherwise you get an error
  # like  "Impossible to connect to XXX.local: Name or service not known"
  services.avahi.nssmdns = true;
}
