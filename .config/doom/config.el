(global-undo-tree-mode t)

(setq display-line-numbers nil)

(setq evil-snipe-override-evil-repeat-keys nil
      doom-localleader-key ","
      doom-localleader-alt-key "M-,")

(modify-syntax-entry ?_ "w")

(turn-off-auto-fill)

;; Add an extra line to work around bug in which-key imprecise
(defun add-which-key-line (f &rest r) (progn (apply f (list (cons (+ 1 (car (car r))) (cdr (car r)))))))
(advice-add 'which-key--show-popup :around #'add-which-key-line)

(setq +ivy-buffer-preview t)

(map! :leader
      :desc "List bookmarks"
      "b L" 'list-bookmarks
      :leader
      :desc "Save current bookmarks to bookmark file"
      "b w" 'bookmark-save)

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Dired open" "d" 'dired
       :desc "Dired jump to current" "j" 'dired-jump
       (:mode dired
        (:map dired-mode-map
         (:prefix ("n" . "narrow")
          :desc "Narrow (default)" "n" 'dired-narrow
          :desc "Narrow (regex)" "r" 'dired-narrow-regexp
          :desc "Narrow (fuzzy)" "f" 'dired-narrow-fuzzy)
         :desc "Peep-dired" "p" 'peep-dired
         :desc "Dired view file" "v" 'dired-view-file))))

(evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
;; Idk why but these things seem necessary

(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

;; Add support for inserting the sub-tree
(evil-define-key 'normal dired-mode-map (kbd "<tab>" ) 'dired-subtree-insert
  (kbd "<backtab>") 'dired-subtree-remove
  (kbd "C-<tab>") 'dired-subtree-cycle
  (kbd "C-c f") 'luklun/dired-subtree-insert-full-tree)

;; Idk why but these things seem necessary
(add-hook 'dired-subtree-hook 'evil-normalize-keymaps)

(setq doom-theme 'doom-moonlight)

(map! :leader
      :desc "Load new theme"
      "h t" 'counsel-load-theme)

(custom-set-variables
 '(elfeed-feeds
   (quote
    (("https://www.reddit.com/r/linux.rss" reddit linux)
     ("https://www.gamingonlinux.com/article_rss.php" gaming linux)
     ("https://hackaday.com/blog/feed/" hackaday linux)
     ("https://opensource.com/feed" opensource linux)
     ("https://linux.softpedia.com/backend.xml" softpedia linux)
     ("https://itsfoss.com/feed/" itsfoss linux)
     ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
     ("https://www.phoronix.com/rss.php" phoronix linux)
     ("http://feeds.feedburner.com/d0od" omgubuntu linux)
     ("https://www.computerworld.com/index.rss" computerworld linux)
     ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
     ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
     ("https://betanews.com/feed" betanews linux)
     ("http://lxer.com/module/newswire/headlines.rss" lxer linux)
     ("https://distrowatch.com/news/dwd.xml" distrowatch linux)))))

(map! :leader
      (:prefix ("e" . "eval")
       :desc "Evaluate elisp in buffer" "b" 'eval-buffer
       :desc "Evaluate defun" "d" 'eval-defun
       :desc "Evaluate elisp expression" "e" 'eval-expression
       :desc "Evaluate last sexpressio" "l" 'eval-last-sexp
       :desc "Evaluate elisp in region"  "r" 'eval-region
       (:prefix ("o" . "org")
        :desc "Evaluate org subtree" "s" 'org-babel-execute-src-block
        :desc "Evaluate org buffer" "e" 'org-babel-execute-buffer
        :desc "Evaluate org code block" "b" 'org-babel-execute-src-block)))

(setq doom-font (font-spec :family "Source Code Pro" :size 12))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(map! :leader
      (:prefix ("v" . "ivy")
       :desc "Ivy push view" "p" 'ivy-push-view
       :desc "Ivy switch view" "s" 'ivy-switch-view))

(map! :leader
      (:prefix ("o")
       :desc "Launch linux exe" "x" 'counsel-linux-app))

(setq display-line-numbers-type 'relative)
(map! :leader
      :desc "Toggle truncate lines"
      "t t" 'toggle-truncate-lines)

(use-package! ox-groff)

(after! mastodon
  (setq mastodon-instance-url "https://mastodon.technology/"))

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer"
      "t n" 'toggle-neotree)

;; (map! :leader
;;       (:prefix-map ("/" . "specific files or dirs")
;;         (:prefix ("w" . "work-related")
;;           (:prefix ("a" . "asgard")
;;             :desc "Open Stylometric dir in Dired" "s" '(lambda () (interactive) (find-file "/mnt/hdd1/home/luklun/FOI/Data-Science-Group/Stylometric"))))))
;;           (:prefix ("m" . "mia")
;;             :desc "Open Cyber dir in Dired" "c" '(lambda () (interactive) (find-file "/mnt/hdd1/FOI/MIA/cyber"))))
;;         (:prefix ("d" . "doom-related")
;;           :desc "Edit doom config.org" "c" '(lambda () (interactive) (find-file "~/.doom.d/config.org"))
;;           :desc "Edit doom init.el" "i" '(lambda () (interactive) (find-file "~/.doom.d/init.el")))))

(map! :leader
      (:prefix ("r" . "registers")
       :desc "Copy to register" "c" 'copy-to-register
       :desc "Framset to register" "f" 'frameset-to-register
       :desc "Insert contents of register" "i" 'insert-register
       :desc "Jump to register" "j" 'jump-to-register
       :desc "Interactively choose a register" "i" 'counsel-register
       :desc "View a register" "v" 'view-register
       :desc "Window configuration to register" "w" 'window-configuration-to-register
       :desc "Increment register" "+" 'increment-register
       :desc "Point to register" "SPC" 'point-to-register))

(setq shell-file-name "/usr/bin/fish"
      eshell-aliases-file "~/.doom.d/aliases")

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window"
      "b c" 'clone-indirect-buffer-other-window)

(map! :leader
      :desc "Winner redo"
      "w <right>" 'winner-redo
      :leader
      :desc "Winner undo"
      "w <left>" 'winner-undo)

(after! pdf-view
  (add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode))

(use-package! frog-jump-buffer
  :config
  (map! :leader
        :desc "Frog Buffer Jumper"
        "b j" 'frog-jump-buffer))

(defun split-window-prefer-horizonally (window)
  "If there's only one window (excluding any possibly active
minibuffer), then split the current window horizontally."
  (if (and (one-window-p t)
           (not (active-minibuffer-window)))
      (let ((split-height-threshold nil))
        (split-window-sensibly window))
    (split-window-sensibly window)))

(setq split-window-preferred-function 'split-window-prefer-horizonally)

(defun +evil/vsplit-follow (&optional target)
  "Splits window vertically and moves to it and perform some action"
  (interactive)
  (evil-window-vsplit ())
  (balance-windows)
  (other-window 1)
  (if (functionp target) (funcall target)))

(defun +evil/split-follow (&optional target)
  "Splits window horizontally and move to it and prefroms some target"
  (interactive)
  (evil-window-split ())
  (balance-windows)
  (other-window 1)
  (if (functionp target) (funcall target)))

(defun +evil/split-follow-empty ()
  "Splits the current windows, moves to it and opens the scratch buffer"
  (interactive)
  (+evil/split-follow '(lambda () (switch-to-buffer "*scratch*"))))

(defun +evil/vsplit-follow-empty ()
  "split"
  (interactive)
  (+evil/vsplit-follow '(lambda () (switch-to-buffer "*scratch*"))))

(defun +evil/split-follow-vterm ()
  "split"
  (interactive)
  (+evil/split-follow '(lambda () (+vterm/here ()))))

(defun +evil/vsplit-follow-vterm ()
  "split"
  (interactive)
  (+evil/vsplit-follow '(lambda () (+vterm/here ()))))

(defun +exwm/counsel-linux-app-action-open-new (desktop-shortcut)
  "Launch DESKTOP-SHORTCUT."
  (interactive)
  (+evil/vsplit-follow-empty)
  (call-process "gtk-launch" nil 0 nil (cdr desktop-shortcut)))


(defun +exwm/counsel-linux-app-new-window (&optional arg)
  "Launch a Linux desktop application in a new buffer, similar to Alt-<F2>.
When ARG is non-nil, ignore NoDisplay property in *.desktop files."
  (interactive "P")
  (ivy-read "Run a command: " (counsel-linux-apps-list)
            :predicate (unless arg (lambda (x) (get-text-property 0 'visible (car x))))
            :action #'+exwm/counsel-linux-app-action-open-new
            :caller 'counsel-linux-app))

;; Replace the default splits functionality
(map! :leader
      :desc "Split vertically and follow"
      "w v" '+evil/vsplit-follow
      :desc  "Split horizontally and follow with vterm"
      "w s" '+evil/split-follow
      :desc "Split vertically, open scratch and follow"
      "w V" '+evil/vsplit-follow-empty
      :desc  "Split horizontally, open scratch and follow"
      "w S" '+evil/split-follow-empty)

;; And for vterm too
(map! :leader
      :desc "Open vterm in new vertical window"
      "o s" '+evil/split-follow-vterm
      :desc "Open vterm in new horizontal window"
      "o v" '+evil/vsplit-follow-vterm)

(use-package! telega
  :commands telega
  :config
  (setq telega-use-tracking-for nil))

(use-package! elfeed
  :commands elfeed
  :config
  (setq elfeed-feeds
        '("https://nullprogram.com/feed/"
          "https://ambrevar.xyz/atom.xml"
          "https://guix.gnu.org/feeds/blog.atom"
          "https://valdyas.org/fading/feed/"
          "https://www.reddit.com/r/emacs/.rss"
          "https://nitter.net/chris_af_VP/rss"
          "https://nitter.net/hanifbali/rss"
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg")))

(use-package! exec-path-from-shell
  :config
  (setq exec-path-from-shell-arguments nil)
  ;; Load the
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  ;; Load the shell path when running as a daemon
  (when (daemonp)
    (exec-path-from-shell-initialize)))

;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(use-package! pyvenv
  :config
  (pyvenv-mode t)
  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(use-package! vue-mode)

;; Search between headings in all org-files
(use-package! helm-org-rifle
  :config
  (map! (:map org-mode-map
               :localleader
               "u s" #'helm-org-rifle))
  :after org)

;; Disable line-numbers when going into org-mode
(add-hook! org-mode (setq display-line-numbers nil))

;; Enables easy search of recent headings in all org-files
(use-package! org-recent-headings
  :after org
  :config
  (map! (:map org-mode-map
               :localleader
               "u r" #'org-recent-headings))
  :hook (org-mode . org-recent-headings-mode))

;; Show current heading at the top of the file
(use-package! org-sticky-header
  :config
  (setq org-sticky-header-full-path 'reversed)
  :hook (org-mode . org-sticky-header-mode))

;; Pretty heading decorator
(use-package! org-bullets
  :hook (org-mode . org-bullets-mode))

;; Adds support for bookmarking headers
(use-package! org-bookmark-heading
  :after org)

;; Download
(use-package! org-protocol-capture-html
  :after org)

(use-package! org-fragtog
  :hook (org-mode . org-fragtog-mode))

(use-package! org-web-tools)

(use-package! org-super-agenda
  :config
  (setq org-super-agenda-groups
        '(;; Each group has an implicit boolean OR operator between its selectors.

          (:name "Important"
           ;; Single arguments given alone
           :tag "bill"
           :priority "A")

          (:name "Work"  ; Optionally specify section name
           :tag "work"
           :tag "aibks"
           :tag "aina"
           :tag "mia")  ; Items that have this TODO keyword

          (:name "Domestic related things"
           :tag "home"
           :tag "clean") ;; Group together everything related to home

          (:name "Clocked Today"
           :log t) ;; Group together everything related to home

          (:name "Training"
           ;; Training things
           :tag ("gym" "run"))

          (:name "Hobby"
           :tag ("workstation" "build"))
          ;; Set order of multiple groups at once
          (:order-multi (2 (:name "Shopping online"
                            ;; Boolean AND group matches items that match all subgroups
                            :and (:tag "buy" :tag "online"))

                           (:name "Food-related"
                            ;; Multiple args given in list with implicit OR
                            :tag "cook")))
          ;; Groups supply their own section names when none are given
          (:todo "WAITING" :order 8)  ; Set order of this section
          (:todo ("SOMEDAY" "READING" "WATCHING")
           ;; Show this group at the end of the agenda (since it has the
           ;; highest number). If you specified this group last, items
           ;; with these todo keywords that e.g. have priority A would be
           ;; displayed in that group instead, because items are grouped
           ;; out in the order the groups are listed.
           :order 9)
          (:priority<= "B"
           ;; Show this section after "Today" and "Important", because
           ;; their order is unspecified, defaulting to 0. Sections
           ;; are displayed lowest-number-first.
           :order 1)
          ;; After the last group, the agenda will display items that didn't
          ;; match any of these groups, with the default order position of 99
          ))
  (setq org-super-agenda-header-map nil)
  :hook (org-mode . org-super-agenda-mode))

(use-package! org-chef
  :config
  ;; Since DOOM already adds some useful templates, lets push these ontop the existing ones
  (dolist (entry '(("c" "Cookbook" entry (file "~/org/cookbook.org")
                    "%(org-chef-get-recipe-from-url)"
                    :empty-lines 1)
                   ("m" "Manual Cookbook" entry (file "~/org/cookbook.org")
                    "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")))
                 (push entry org-capture-templates)))

(defun luklun/list-recipies (str pred _)
  (let ((headings '()))
    (org-map-entries
     (lambda ()
       (let ((level (nth 1 (org-heading-components)))
             (heading (nth 4 (org-heading-components))))
         (if (= level 1)
             (push (propertize heading 'property (concat "[[file:" (buffer-file-name) "::*" heading "][" heading "]]")) headings))))
     nil
     '("~/org/cookbook.org"))
    headings))

(defun find-candidates ()
  (interactive)
  (let (link)
    (ivy-read "Select a recipe"
            #'luklun/list-recipies
            :action #'(lambda(x) (setq link (get-text-property 0 'property x))))
    link))


(push '("d" "dinner entry" entry
        (file+headline "~/org/meals.org" "Dinner")
        "* TODO  %(call-interactively 'find-candidates) :cook:\n%i\n%^{chef}p\n%?" :prepend t)
    org-capture-templates)

(after! org
  ;; Disable Autofill Mode in Org Buffer
  (auto-fill-mode -1)

  ;; Open pdf-files from org in emacs instead of system default app
  (add-to-list 'org-file-apps '("\\.pdf\\'" . emacs))

  (push '("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
        org-capture-templates)

  (setq
   org-clock-persist 'history
   org-clock-idle-time 5)
  (org-clock-persistence-insinuate)

  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-agenda-span 21
        org-journal-dir "~/org/journal/"
        org-journal-date-format "%B %d, %Y (%A)"
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t)

  ;; ex. of org-link-abbrev-alist in action
  ;; [[arch-wiki:Name_of_Page][Description]]
  (setq org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
        '(("google" . "http://www.google.com/search?q=")
          ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
          ("ddg" . "https://duckduckgo.com/?q=")
          ("wiki" . "https://en.wikipedia.org/wiki/")))

  (setq org-todo-keywords       ; This overwrites the default Doom org-todo-keywords
        '((sequence
           "TODO(t)"            ; A task that is ready to be tackled
           "POSTPONED(p)"       ; Something is holding up this task
           "SOMEDAY(s)"         ; Do this someday
           "READING(r)"         ; Reading this things
           "WATCHING(w)"        ; Is currently watching
           "|"                  ; The pipe necessary to separate "active" states and "inactive" states
           "DONE(d)"           ; Task has been completed
           "CANCELLED(c)" ))) ; Task has been cancelled

  ;; Set tag list
  (setq org-tag-alist '((:startgrouptag)
                        ("work")
                        (:grouptags)
                        ("@work")
                        ("aina")
                        ("aikbs")
                        ("mia")
                        (:endgrouptag)
                        (:startgrouptag)
                        ("home")
                        (:grouptags)
                        ("@home")
                        ("cook")
                        ("clean")
                        ("buy")
                        ("bill")
                        (:endgrouptag)
                        (:startgrouptag)
                        ("hobby")
                        (:grouptags)
                        ("gym")
                        ("run")
                        ("read")
                        ("badminton")
                        ("code")
                        ("build")
                        ("workstation")
                        (:endgrouptag)
                        ("@online")
                        ("@bank")))

  )

(defun luklun/hide-all-keywords ()
  "Hide all keywords in the current org-mode buffer"
  (save-excursion
    (let (beg end ov)
      (goto-char (point-min))
      (while (re-search-forward "\\(^[ \t]*#\\+.+$\\)" nil t)
        (setq beg (match-beginning 1)
              end (match-end 1)
              ov  (make-overlay beg end))
        (overlay-put ov 'invisible t)))))

(defun luklun/show-all-keywords ()
  "show all hidden keywords in the current org-mode buffer"
  (save-excursion
    (let (beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\(^[ \t]*#\\+.+$\\)" nil t)
        (setq beg (match-beginning 1)
              end (match-end 1))
        (dolist (o (overlays-in beg end))
          (delete-overlay o))))))

(defun luklun/presentation-setup ()
  (setq display-line-numbers nil)
  ;; (luklun/hide-all-keywords)
  ;; (hide-lines "#+")
  (hide-lines-matching "#+")
  (org-display-inline-images))

(defun luklun/presentation-teardown ()
  ;; (luklun/show-all-keywords)
  (hide-lines-show-all)
  )

(use-package! centered-window)

(use-package! org-tree-slide
  :commands org-tree-slide-mode
  :config
  ;; There is probably a better way of doing this
  (load! "modules/lang/org/autoload/contrib-present" doom-emacs-dir)
  (defvar +org-present-text-scale 5
    "The `text-scale-amount' for `org-tree-slide-mode'.")
  (org-tree-slide-simple-profile)
  (setq org-tree-slide-skip-outline-level 2
        org-tree-slide-modeline-display 'outside
        org-tree-slide-slide-in-effect t
        org-tree-slide-activate-message "Presentation started!"
        org-tree-slide-deactivate-message "Presentation finished!"
        org-tree-slide-breadcrumbs " > "
        org-image-actual-width nil
        org-tree-slide-heading-emphasis t)

  (add-hook 'org-tree-slide-mode-after-narrow-hook #'org-display-inline-images)
  (add-hook! 'org-tree-slide-mode-hook
             #'+org-present-hide-blocks-h
             #'+org-present-prettify-slide-h)

  (add-hook 'org-tree-slide-play-hook #'luklun/presentation-setup)
  (add-hook 'org-tree-slide-stop-hook #'luklun/presentation-teardown)

  (when (featurep! :editor evil)
    (map! :map org-tree-slide-mode-map
          :n [C-right] #'org-tree-slide-move-next-tree
          :n [C-left]  #'org-tree-slide-move-previous-tree
          :leader
          "t p" #'org-tree-slide-mode)
    (add-hook 'org-tree-slide-mode-hook #'evil-normalize-keymaps)))

(use-package! org-ref
  :config
  ;; (org-ref-ivy-cite-completion)
  (setq org-ref-bibliography-notes "~/org/ref/notes.org"
        org-ref-default-bibliography '("~/org/ref/references.bib")
        org-ref-pdf-directory "~/org/ref/bibtex-pdf/"
        biblio-download-directory "~/org/ref/bibtex-pdf/"
        bibtex-completion-pdf-open-function 'org-open-file))

(use-package! helm-bibtex
  :config
  (setq bibtex-completion-bibliography '("~/org/ref/references.bib")))

(use-package! org-roam-bibtex
  :after org-roam
  :config
  (setq orb-templates
    '(("r" "ref" plain (function org-roam-capture--get-point) ""
      :file-name "${citekey}"
      :head "#+title: ${title}\n#+roam_key: ${ref}\n"
      :unnarrowed t)))
  :hook (org-roam-mode . org-roam-bibtex-mode))



(defun luklun/format-filename (title)
  (setq title (downcase title))
  (replace-regexp-in-string " " "_" title))

(after! org-roam
  (setq org-roam-buffer-position 'right)
  (setq org-roam-capture-templates
        '(("r" "research" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%(luklun/format-filename \"${title}\")"
           :head "#+title: ${title}\n"
           :unnarrowed t))
        ))

(use-package org-transclusion
  :after org
  :config
  (define-key global-map (kbd "<f12>") #'org-transclusion-mode))

(map! (:map org-mode-map
       :localleader
       ;; Ways to execute org-mode source blocks
       (:prefix ("j" . "evaluate")
        :desc "Evaluate org subtree" "s" 'org-babel-execute-src-block
        :desc "Evaluate org buffer" "e" 'org-babel-execute-buffer
        :desc "Evaluate org code block" "b" 'org-babel-execute-src-block)

       ;; Org-reference
       (:prefix ("u" . "org-ref")
        :desc "Insert reference" "i" 'org-ref-insert-link
        :desc "Org-rifle" "s" 'helm-org-rifle
        :desc "Format current src block" "TAB" 'luklun/org-format-block
        :desc "Format all src block" "f" 'luklun/org-format-all-blocks)))

;; (use-package! eaf
;;   :config
;;   (require 'eaf-evil)
;;   (setq eaf-evil-leader-keymap  doom-leader-map)
;;   (setq eaf-evil-leader-key "SPC"))

(defun luklun/get-link()
  (interactive)
  (message "Hello %s" (nth 4 (org-heading-components)))
  (org-next-link)
  (message "Moved to %s" (nth 4 (org-heading-components)))
  ;(org-open-at-point)
  (message "%s" (buffer-file-name)))

(defun luklun/extract-ingridients ()
    (org-ql-select
        '("~/org/meals.org")
        '(and '(TODO) '(tags "cook") (level 2))
        :action #'(lambda ()
                    (org-next-link)
                )
        ))

(setq luklun/parse-tree (org-element-parse-buffer))

(setq company-idle-delay 0)
