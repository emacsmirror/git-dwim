;;;; git-branch.el --- git branch handling in Emacs
;; Time-stamp: <2010-07-14 09:17:58 rubikitch>

;; Copyright (C) 2010  rubikitch

;; Author: rubikitch <rubikitch@ruby-lang.org>
;; Keywords: git, tools, convenience
;; URL: http://www.emacswiki.org/cgi-bin/wiki/download/git-branch.el

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
;; Put git-branch.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'git-branch)
;;
;; No need more.

;;; Customize:
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET git-branch RET
;;


;;; History:

;; See http://www.rubyist.net/~rubikitch/gitlog/emacs-git-branch.txt

;;; Code:

(eval-when-compile (require 'cl))
(defgroup git-branch nil
  "git-branch"
  :group 'vc)

(provide 'git-branch)

;; How to save (DO NOT REMOVE!!)
;; (progn (git-log-upload) (emacswiki-post "git-branch.el"))
;;; git-branch.el ends here
