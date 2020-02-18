(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))



;; Creates a new file for a diary entry into phd progress!
(defun sharp/new-phd-diary ()
  "This function can be used to create an org file with today as it's file name."
  (interactive)
  (find-file  (concat "~/PHD/Notes/" (format-time-string "phd-diaries/%Y/%m/%W.org" )))
  (insert
   (format
    "#+TITLE: %s
#+AUTHOR: Nathan Hughes
#+INCLUDE: \"./preamble.org\" :minlevel 1

* Tasks

 bibliography:../../../library.bib
 bibliographystyle:plainnat
 " "PhD Diary" ) ) )


(defun sharp/find-phd-diary ()
  (interactive)
  (find-file  (concat "~/PHD/Notes/" (format-time-string "phd-diaries/%Y/%m/%W.org" ))))


(defun friday-talks ()
  "This function can be used to create an org file with today as it's file name."
  (interactive)
  (find-file  (concat "~/PHD/Notes/" (format-time-string "friday-seminar-%Y-%W.org" ))))

(defun sharp/save-report ()
  "Exports a tex version of the report document"
  (interactive)
  (setq sharp/last-buffer (current-buffer))
  (find-file "~/PHD/Probation/report.org")
  (org-latex-export-to-latex)
  (switch-to-buffer sharp/last-buffer)
  (shell-command "texcount report.tex | grep 'Words'"))

(defun sharp/run-compile ()
  "runs a nice commands to constantly build on change my report"
  (interactive)
  (async-shell-command "cd ~/PHD/Probation/; latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f report.tex --synctex=1 -pvc -view=none")
  )

(defun sharp/save-presentation ()
  "Exports a tex version of the report document"
  (interactive)
  (org-beamer-export-to-latex)
)

(defun sharp/run-compile ()
  "runs a nice commands to constantly build on change my report"
  (interactive)
  (async-shell-command "cd ~/PHD/Probation/; latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f report.tex --synctex=1 -pvc -view=none")
  )

(defun sharp/run-compile-presentation ()
  "runs a nice commands to constantly build on change my report"
  (interactive)
  (async-shell-command "cd ~/PHD/Documents/Presentations/project_update_beamer/September; latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f presentation.tex --synctex=1 -pvc -view=none")
  )

