{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Paul Ravoux";
      user.email = "paul.ravoux@un.org";

      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "vim";
    };
  };
}
