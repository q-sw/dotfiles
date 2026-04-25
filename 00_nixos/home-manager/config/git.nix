{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "q-sw";
        email = "quentin.swiech@gmail.com";
      };
      core = {
        autocrlf = "input"; # keep newlines as in input
        compression = 9; # trade cpu for network
        fsync = "none";
        whitespace = "error"; # threat incorrect whitespace as errors
      };
      advice = {
        # disable advices
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };
      blame = {
        coloring = "highlightRecent";
        date = "relative";
      };
      diff = {
        context = 3; # less context in diffs
        renames = "copies"; # detect copies as renames in diffs
        interHunkContext = 10; # merge near hunks in diffs
      };
      init = {
        defaultBranch = "main";
      };
      log = {
        abbrevCommit = true; # short commits
        graphColors = "blue,yellow,cyan,magenta,green,red";
      };
      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all"; # show individual untracked files
      };
      pager = {
        branch = false; # no need to use pager for git branch
        diff = "diff-so-fancy | $PAGER"; # diff-so-fancy as diff pager
      };
      push = {
        autoSetupRemote = true; # easier to push new branches
        default = "current"; # push only current branch by default
        followTags = true; # push also tags
        gpgSign = false; # my remotes doesn't support sign pushes
      };
      pull = {
        rebase = true;
      };
      submodule = {
        fetchJobs = 16;
      };

      rebasea = {
        autoStash = true;
      };

      color = {
        branch = {
          current = "magenta";
          local = "default";
          remote = "yellow";
          upstream = "green";
          plain = "blue";
        };
        diff = {
          meta = "black bold";
          frag = "magenta";
          context = "white";
          whitespace = "yellow reverse";
        };
      };
      url = {
        "git@github.com:" = {
          insteadOf = "gh:";
        };
      };
    };
  };
}
