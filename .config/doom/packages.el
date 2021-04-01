;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.
;;
;; WARNING: Disabling core packages listed in ~/.emacs.d/core/packages.el may
;; have nasty side-effects and is not recommended.


;; All of Doom's packages are pinned to a specific commit, and updated from
;; release to release. To un-pin all packages and live on the edge, do:
;(unpin! t)

;; ...but to unpin a single package:
;(unpin! pinned-package)
;; Use it to unpin multiple packages
;(unpin! pinned-package another-pinned-package)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))


;; DIRED RELATED CONFIGURATIONS
(package! peep-dired)
(package! dired-narrow)
(package! dired-subtree)

;; DISTROTUBE RECOMMENDED PACKAGES
(package! dmenu)
(package! elfeed)
(package! emms)
(package! emojify)
(package! mastodon)
(package! md4rd)
(package! peep-dired)
(package! rainbow-mode)
(package! sublimity)
(package! tldr)
(package! wc-mode)
(package! writeroom-mode)


(package! bluetooth)
(package! frog-jump-buffer)
(package! neotree)

(package! telega)

(package! emacs-webkit
  :recipe (:host github
           :repo "akirakyle/emacs-webkit"
           :files (:defaults "Makefile" "*.h" "*.c" "*.js" "*.css" "*.so")
           :branch "main"))

;; EXWM
(package! helm-exwm)
(package!  exwm)
(package! ivy-posframe)

;; DEVELOPMENT
(package! exec-path-from-shell)
(package! desktop-environment)
(package! pyvenv)
(package! vue-mode)
(package! magit-todos)


;; ORG-MODE-PACKAGES
(package! org-bullets)
(package! org-alert)
(package! org-fragtog)
(package! org-ref)
(package! org-re-reveal)
(package! org-re-reveal-ref)
(package! org-tree-slide)
(package! helm-org-rifle)
(package! org-recent-headings)
(package! org-sticky-header)
(package! org-super-agenda)
(package! org-bookmark-heading)
(package! org-protocol-capture-html
  :recipe (:host github
           :repo "alphapapa/org-protocol-capture-html"))
(package! org-web-tools)
(package! org-transclusion
  :recipe (:host github
           :repo "nobiot/org-transclusion"))

;; Following the installation instructions on the github
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
;; When using org-roam via the `+roam` flag
(unpin! org-roam company-org-roam)
;; When using bibtex-completion via the `biblio` module
(unpin! bibtex-completion helm-bibtex ivy-bibtex)


;; STYLING
(package! centered-window
:recipe (:host github :repo "anler/centered-window-mode"))
(package! hide-lines
  :recipe (:host github :repo "vapniks/hide-lines"))

(package! eaf
  :recipe (:host github
           :files (:defaults "*.el" "app" "core" "eaf.py")
           :repo "manateelazycat/emacs-application-framework"))

;; Creating
(package! org-chef
  :recipe (:host github
          :repo "chobbes/org-chef"))
(package! org-ql)
(package! org-ml)


(package! exwm-firefox-core)
(package! exwm-firefox-evil)

(package! nano-emacs
  :recipe (:host github
           :repo "rougier/nano-emacs"
           :files (:defaults "nano-writer.el")))

(package! cython-mode)
(package! flycheck-cython)


(package! sphinx-doc
  :recipe (:host github
           :repo "naiquevin/sphinx-doc.el"))

(package! nano-doom
  :recipe (:host
           github :repo "skyler544/doom-nano-testing"))
