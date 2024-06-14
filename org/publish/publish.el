(progn
  (setq local-prefix "~/public_html/")
  (setq n133906-prefix "//n133906/home/_namatv/public_html/Site/CFD/")
  (setq fscluster-prefix "//fscluster/KO/Temp/Отд11/CFD/")
;;;;
  (cond
   ((equal (system-name) "uakazi-note")
    (setq prefix local-prefix))
   (t (setq prefix n133906-prefix)))
;;;;
  (setq prj-root
        (get-ancestor-directory-name (get-relative-path (buffer-file-name)) 3))

  (setq org-publish-project-alist
        `(
          ,(org-pub-list "pub"          "org/publish")
          ,(org-pub-list "main"         "org" :with-toc t)
;;;;          
          ,(org-att-list "images" "png" "images" :recursive t)
          ,(org-att-list "pub"    "el"  "org/publish")

          ,(org-att-list "tcl"    "tcl"  ".")
          ,(org-att-list "bat"    "bat"  ".")          
          ))
  (org-web-list))

(progn
  (require 'ox-publish)
  (setq org-publish-use-timestamps-flag nil)
  (setq org-confirm-babel-evaluate nil) ; выполнение всех блоков кода без подтверждения
  (org-publish-project "website"))
