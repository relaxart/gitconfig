## Install

Clone repository in home directory. After that, add in your .gitconfig  

	[include]  
		path = gitconfig/config  

## Add/Remove submodule ignore
**git s-ignore-add submodule_path**  
**git s-ignore-remove submodule_path**  

## Short commands
**git co** - Git checkout  
**git ci** - Git commit  
**git st** - Git status  
**git br** - Git branch  
**git su** - Git recursive submodule update with initialization  
**git pr** - Git pull with rebase  
**git cl** - Git clean main repository and submodule recursive clean  
**git ps** - Git pull with rebase and submodule recursive update with initialization  
**git pc** - Two command cl + ps  
**git lg** - Pretty git log  
**git dlb** - Remove all local merged branches  

## Submodule commands
- git s-branch   
- git s-stash 
- git s-stash-pop 
- git s-checkout
- git s-commit
- git s-pull
- git s-path
  
## Main repository + submodule commands
- git m-branch
- git m-stash
- git m-stash-pop
- git m-checkout
- git m-commit
- git m-pull
