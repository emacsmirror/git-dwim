;;;; git-dwim.el --- git branch handling in Emacs
;; Time-stamp: <2010-07-14 23:14:38 rubikitch>

;; Copyright (C) 2010  rubikitch

;; Author: rubikitch <rubikitch@ruby-lang.org>
;; Keywords: git, tools, convenience
;; URL: http://www.emacswiki.org/cgi-bin/wiki/download/git-dwim.el

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; 

;;; Commands:
;;
;; Below are complete command list:
;;
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Installation:
;;
;; Put git-dwim.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'git-dwim)
;;
;; No need more.

;;; Customize:
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET git-dwim RET
;;


;;; History:

;; See http://www.rubyist.net/~rubikitch/gitlog/emacs-git-dwim.txt

;;; Code:

(eval-when-compile (require 'cl))
(defgroup git-dwim nil
  "git-dwim"
  :group 'vc)

(defun gb/current-branch ()
  (substring (shell-command-to-string "git branch | grep '\*'") 2 -1))
(defun gb/get-branches ()
  (split-string (shell-command-to-string "git branch | cut -b3-") "\n" t))

(defun git-branch-next-action ()
  (interactive)
  (cond ((equal (gb/current-branch) "master")
         (case (read-event "[s]witch-to-other-branch [c]reate-new-branch")
           ((?s ?\C-s) (gb/switch-to-other-branch))
           ((?c ?\C-c) (gb/create-new-branch))
           (t          (error "invalid key"))))
        ;; TODO conflict in rebase
        (t
         (case (read-event "[s]witch-to-other-branch [m]erge-to-master")
           ((?s ?\C-s) (gb/switch-to-other-branch))
           ((?m ?\C-m) (gb/merge-to-master))
           (t          (error "invalid key"))))))

(defun gb/create-new-branch (&optional branch)
  (setq branch (or branch (read-string "Create and switch to new branch: ")))
  (shell-command (format "git checkout -b %s" branch)))
(defun gb/switch-to-other-branch (&optional branch)
  (setq branch (or branch (completing-read "Switch to new branch: "
                                           (gb/get-branches) nil t)))
  (shell-command (format "git checkout %s" branch)))
(defun gb/merge-to-master ()
  (unless (string-match "CONFLICT" (shell-command-to-string "git rebase master"))
    (let ((branch (gb/current-branch)))
      (shell-command (format "git checkout master; git merge %s; git branch -d %s"
                             branch branch)))))
(global-set-key "\C-xvB" 'git-branch-next-action)
(provide 'git-dwim)

;; How to save (DO NOT REMOVE!!)
;; (progn (git-log-upload) (emacswiki-post "git-dwim.el"))
;;; git-dwim.el ends here
