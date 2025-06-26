;;;; ./org/publish/publish.el
(progn
  ;;(org-setup "//n133906/home/_namatv/public_html/Site/CFD/dev/tcl" (home-ancestor 2))
  ;;(org-setup "//fscluster/CAD-CAM/OAKTC_Programs/ANSYS/ICEM_tcl" (home-ancestor 2))
  (org-setup "~/public_html/ICEM_tcl" (home-ancestor 2))  
 
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
