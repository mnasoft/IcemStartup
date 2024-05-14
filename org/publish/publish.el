(progn
  (setq local-prefix "~/public_html/")
  (setq n133906-prefix "//n133906/home/_namatv/public_html/Site/CFD/")
;;;;
  (cond
   ((equal (system-name) "uakazi-note")
    (setq prefix local-prefix))
   (t (setq prefix n133906-prefix)))
;;;;
  (setq prj-root (get-ancestor-directory-name
                  (get-relative-path
                   (buffer-file-name)) 3)
        html-head "<link rel=\"stylesheet\" href=\"../other/mystyle.css\" type=\"text/css\"/>")

  (setq org-publish-project-alist
        `(("pub-org"
           :base-directory ,(concat "~/" prj-root "/org/publish/")
           :base-extension "org"
           :publishing-directory ,(concat prefix prj-root "/org/publish/")
           :publishing-function org-html-publish-to-html
           :headline-levels 3
           :section-numbers nil
           :with-toc nil
           :html-head ,html-head
           :html-preamble t)
          ("main-org"
           :base-directory ,(concat "~/" prj-root "/org/")
           :base-extension "org"
           :publishing-directory ,(concat prefix prj-root "/org/")
           :publishing-function org-html-publish-to-html
           :exclude "ToDo.org" ;; regexp
           :headline-levels 3
           :section-numbers nil
           :with-toc nil
           :html-head ,html-head
           :html-preamble t)
          ("images"
           :base-directory ,(concat "~/" prj-root "/images/")
           :base-extension "png"
           :publishing-directory ,(concat prefix prj-root "/images/")
           :publishing-function org-publish-attachment)
          ("website" :components ("pub-org" "main-org"  "images"))))
;;;;
  (require 'ox-publish)
  (setq org-publish-use-timestamps-flag nil)
  (setq org-confirm-babel-evaluate nil) ; выполнение всех блоков кода без подтверждения
  (org-publish-project "website"))

