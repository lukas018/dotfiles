(map! :map general-override-mode-map
    :n " C-SPC" #'doom/leader
    :ei "C-SPC" #'doom/leader)

(map! :map general-override-mode-map
    :n " M-SPC" #'doom/leader
    :ei "M-SPC" #'doom/leader)

;; Consider _ as a word-character
(modify-syntax-entry ?_ "w")

;; (setq doom-theme 'nil)
;; (require 'disp-table)
;; (require 'nano-theme-dark)
;; (require 'nano-help)
;; (require 'nano-modeline)
;; (require 'nano-layout)

(setq doom-theme 'doom-city-lights)

(map! :leader
      :desc "Load new theme"
      "h t" 'counsel-load-theme)

(turn-off-auto-fill)

;; Add an extra line to work around bug in which-key imprecise
(defun add-which-key-line (f &rest r) (progn (apply f (list (cons (+ 1 (car (car r))) (cdr (car r)))))))
(advice-add 'which-key--show-popup :around #'add-which-key-line)

(setq display-line-numbers-type nil)
(setq display-line-numbers nil)

(map! :leader
      :desc "Toggle truncate lines"
      "t t" 'toggle-truncate-lines)

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

(setq doom-font (font-spec :family "RobotoMono" :size 12))
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

(require 'ox-groff)

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

(after! org
  (require 'org-bullets)  ; Nicer bullets in org-mode
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; Allow for latex-previews of equations
  (add-hook 'org-mode-hook 'org-fragtog-mode)
  ;; Disable Autofill Mode in Org Buffer
  (auto-fill-mode -1)
  (setq org-directory "~/Org/"
        org-agenda-files '("~/Org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/Org/journal/"
        org-journal-date-format "%B %d, %Y (%A)"
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

(defun luklun/get-org-file-keyword (KEYWORD)
  "Get the value from a line like this ,#+KEYWORD: value in a file."
  (interactive)
  (let ((case-fold-search t)
        (re (format "^#\\+%s:[ \t]+\\([^\t\n]+\\)" KEYWORD)))
    (if (not (save-excursion
               (or (re-search-forward re nil t)
                   (re-search-backward re nil t))))
        (error (format "No line containing #+%s: value found" KEYWORD)))
    (match-string 1)))

(defun luklun/org-init-ispell ()
    "Initialize the correct ispell dictionary for the org-document if it LANG keyword is specified"
    (let ((lang (luklun/get-org-file-keyword "LANG")))
       (when lang
            (display-message-or-buffer "Setting ispell dictionary to %s" lang)
            (ispell-change-dictionary lang))))

(after! org
 (add-hook 'org-mode-hook 'luklun/org-init-ispell))

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

(setq shell-file-name "/bin/zsh"
      eshell-aliases-file "~/.doom.d/aliases")

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window"
      "b c" 'clone-indirect-buffer-other-window)

(require 'sublimity-scroll)
(require 'sublimity-map)
(require 'sublimity-attractive)
(sublimity-mode 0)

(map! :leader
      :desc "Winner redo"
      "w <right>" 'winner-redo
      :leader
      :desc "Winner undo"
      "w <left>" 'winner-undo)

(after! pdf-view
    (add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode))

(use-package frog-jump-buffer)
(map! :leader
    :desc "Frog Buffer Jumper"
    "b j" 'frog-jump-buffer)

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

;; Replace the default splita functionality
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

(defun efs/run-in-background (command)
  (let ((command-parts (split-string command "[ ]+")))
    (apply #'call-process `(,(car command-parts) nil 0 nil ,@(cdr command-parts)))))

(defun efs/set-wallpaper ()
  (interactive)
  ;; NOTE: You will need to update this to a valid background path!
  (start-process-shell-command
      "feh" nil  "feh --bg-scale /usr/share/backgrounds/matt-mcnulty-nyc-2nd-ave.jpg"))

(defun efs/exwm-init-hook ()
  ;; Make workspace 1 be the one where we land at startup
  (exwm-workspace-switch-create 1)

  ;; Open eshell by default
  ;;(eshell)
  ;; Show battery status in the mode line
  (display-battery-mode 1)

  ;; Show the time and date in modeline
  (setq display-time-day-and-date t)
  (display-time-mode 1)
  ;; Also take a look at display-time-format and format-time-string

  ;; Launch apps that will run in the background
  (efs/run-in-background "nm-applet")
  (efs/run-in-background "pasystray")
  (efs/run-in-background "blueman-applet"))

(defun efs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(use-package exwm
  :config
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 10)

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)

  ;; When EXWM starts up, do some extra confifuration
  (add-hook 'exwm-init-hook #'efs/exwm-init-hook)

  ;; Rebind CapsLock to Ctrl
  (start-process-shell-command "xmodmap" nil "xmodmap ~/.emacs.d/exwm/Xmodmap")

  ;; Set the screen resolution (update this to be the correct resolution for your screen!)
  ;; (require 'exwm-randr)
  ;; (exwm-randr-enable)
  ;; (start-process-shell-command "xrandr" nil "xrandr --output Virtual-1 --primary --mode 2048x1152 --pos 0x0 --rotate normal")

  ;; Set the wallpaper after changing the resolution
  (efs/set-wallpaper)

  ;; Load the system tray before exwm-init
  ;; (require 'exwm-systemtray)
  ;; (setq exwm-systemtray-height 32)
  ;; (exwm-systemtray-enable)

  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-\
      ?\M-&
      ?\M-:
      ?\C-\M-j  ;; Buffer list
      ?\C-\ ;; Ctrl+Space
      ?\ ;; Ctrl+Space
  ))

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ([?\s-h] . evil-window-left)
          ([?\s-j] . evil-window-down)
          ([?\s-k] . evil-window-up)
          ([?\s-l] . evil-window-right)

          ;; Kill buffer
          ([?\s-q] . kill-this-buffer)
          ([?\s-Q] . +workspace/close-window-or-workspace)

          ;; Move windows
          ([?\s-H] . +evil/window-move-left)
          ([?\s-J] . +evil/window-move-down)
          ([?\s-K] . +evil/window-move-up)
          ([?\s-L] . +evil/window-move-right)
          ;; move window to far left or far right with SUPER+CTRL+h,l
          ([?\s-\C-h] . side-left-window)
          ([?\s-\C-j] . side-bottom-window)
          ([?\s-\C-l] . side-right-window)
          ([?\s-\C-d] . side-window-delete-all)
          ([?\s-\C-r] . resize-window)

          ;; Launch applications via shell command
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))
          ;; move window workspace with SUPER+SHIFT+{0-9}
          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)
          ([?\s-`] . (lambda () (interactive) (exwm-workspace-switch-create 0)))

          ([?\s-v] . +evil/vsplit-follow)
          ([?\s-z] . +evil/split-follow)
          ;; managing workspaces
          ([?\s-w] . exwm-workspace-switch)
          ([?\s-W] . exwm-workspace-swap)

          ;; Toggle between line and char mode
          ([?\s-e] . exwm-input-toggle-keyboard)
          ([?\s-/] . exwm-input-release-keyboard)
          ([?\s-?] . exwm-reset)
          ;; setting some toggle commands
          ([?\s-f] . exwm-floating-toggle-floating)
          ([?\s-m] . exwm-layout-toggle-mode-line)
          ([f11] . exwm-layout-toggle-fullscreen)

          ;; TODr There has to be a better way of doing this
          ;; move window workspace with SUPER+SHIFT+{0-9}
          ([?\s-\)] . (lambda () (interactive) (exwm-workspace-move-window 0)))
          ([?\s-!] . (lambda () (interactive) (exwm-workspace-move-window 1)))
          ([?\s-@] . (lambda () (interactive) (exwm-workspace-move-window 2)))
          ([?\s-#] . (lambda () (interactive) (exwm-workspace-move-window 3)))
          ([?\s-$] . (lambda () (interactive) (exwm-workspace-move-window 4)))
          ([?\s-%] . (lambda () (interactive) (exwm-workspace-move-window 5)))
          ([?\s-^] . (lambda () (interactive) (exwm-workspace-move-window 6)))
          ([?\s-&] . (lambda () (interactive) (exwm-workspace-move-window 7)))
          ([?\s-*] . (lambda () (interactive) (exwm-workspace-move-window 8)))
          ([?\s-\(] . (lambda () (interactive) (exwm-workspace-move-window 9)))
          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))))




  ;; Enable char mode by default in all exwm buffers
  (setq exwm-manage-configurations '((t char-mode t)))
  (exwm-enable))

(use-package helm-exwm
  :config
  (setq exwm-layout-show-all-buffers t)
  (setq helm-exwm-emacs-buffers-source (helm-exwm-build-emacs-buffers-source))
  (setq helm-exwm-source (helm-exwm-build-source))
  (setq helm-mini-default-sources `(helm-exwm-emacs-buffers-source
                                    helm-exwm-source
                                    helm-source-recentf)))

(exwm-input-set-key (kbd "s-d") 'counsel-linux-app)
;; Launch the application in a new window
(exwm-input-set-key (kbd "s-D") '+exwm/counsel-linux-app-new-window)
;; List active x-window buffers with helm
(exwm-input-set-key (kbd "s-x") 'helm-exwm)

(use-package desktop-environment
  :after exwm

  :config
  (exwm-input-set-key (kbd "<s-f6>") 'desktop-environment-brightness-increment)
  (exwm-input-set-key (kbd "<s-f5>") 'desktop-environment-brightness-decrement)
  (exwm-input-set-key (kbd "<s-f12>") 'desktop-environment-volume-increment)
  (exwm-input-set-key (kbd "s-.") 'desktop-environment-volume-increment)
  (exwm-input-set-key (kbd "<s-f11>") 'desktop-environment-volume-decrement)
  (exwm-input-set-key (kbd "s-,") 'desktop-environment-volume-decrement)
  (exwm-input-set-key (kbd "<s-f10>") 'desktop-environment-toggle-mute)
  (exwm-input-set-key (kbd "s-b") 'desktop-environment-toggle-mute)
  (exwm-input-set-key (kbd "s-C-p") 'desktop-environment-lock-screen)
  (exwm-input-set-key (kbd "s-C-b") 'desktop-environment-toggle-bluetooth)
  :custom
  (desktop-environment-brightness-small-increment "2%+")
  (desktop-environment-brightness-small-decrement "2%-")
  (desktop-environment-brightness-normal-increment "5%+")
  (desktop-environment-brightness-normal-decrement "5%-"))

(use-package telega
:commands telega
:config
(setq telega-use-tracking-for nil))

(use-package elfeed
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
        ;; Load the
        (when (memq window-system '(mac ns x))
        (exec-path-from-shell-initialize))
        ;; Load the shell path when running as a daemon
        (when (daemonp)
        (exec-path-from-shell-initialize)))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)

  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

;; Use the microsoft server because it is faster
(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "pyls")
                     :major-modes '(python-mode)
                     :remote? t
                     :server-id 'pyls-remote))

(use-package vue-mode)

(use-package! eaf
  :config
  (require 'eaf-evil)
  (setq eaf-browser-continue-where-left-off t)
  (setq eaf-evil-leader-key "SPC"))
