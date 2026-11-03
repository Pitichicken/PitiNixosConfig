{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        dimensions = {
          columns = 100;
          lines = 28;
        };

        padding = {
          x = 15;
          y = 15;
        };

        decorations = "None";

        opacity = 0.8;
      };


      font = {
        normal = {
          family = "monospace";
          style = "Regular";
        };

        bold = {
          family = "monospace";
          style = "Bold";
        };

        size = 11.0;
      };


      colors = {

        primary = {
          background = "#000000";
          foreground = "#FFFFFF";
        };


        normal = {
          black   = "#000000";
          red     = "#FF5555";
          green   = "#50FA7B";
          yellow  = "#F1FA8C";
          blue    = "#0066FF";
          magenta = "#FF79C6";
          cyan    = "#8BE9FD";
          white   = "#BBBBBB";
        };


        bright = {
          black   = "#555555";
          red     = "#FF6E6E";
          green   = "#69FF94";
          yellow  = "#FFFFA5";
          blue    = "#3388FF";
          magenta = "#FF92DF";
          cyan    = "#A4FFFF";
          white   = "#FFFFFF";
        };
      };
    };
  };
}
