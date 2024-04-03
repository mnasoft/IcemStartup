(progn
  (setq local-prefix "~/public_html/")
  (setq n133906-prefix "//n133906/home/_namatv/public_html/Site/CFD/")
  (setq prefix n133906-prefix)

  (setq org-publish-project-alist
        `(("pub-org"
           :base-directory "~/devel/tcl/IcemStartup/org/publish/"
           :base-extension "org"
           :publishing-directory ,(concat prefix "devel/tcl/IcemStartup/org/publish/")
           :publishing-function org-html-publish-to-html
           :headline-levels 3
           :section-numbers nil
           :with-toc nil
           :html-head "<link rel=\"stylesheet\"
                  href=\"../other/mystyle.css\" type=\"text/css\"/>"
           :html-preamble t)
          ("main-org"
           :base-directory "~/devel/tcl/IcemStartup/org/"
           :base-extension "org"
           :publishing-directory ,(concat prefix "devel/tcl/IcemStartup/org/")
           :publishing-function org-html-publish-to-html
           :exclude "ToDo.org" ;; regexp
           :headline-levels 3
           :section-numbers nil
           :with-toc nil
           :html-head "<link rel=\"stylesheet\"
                  href=\"../other/mystyle.css\" type=\"text/css\"/>"
           :html-preamble t)
          ("images"
           :base-directory "~/devel/tcl/IcemStartup/images/"
           :base-extension "png"
           :publishing-directory ,(concat prefix "devel/tcl/IcemStartup/images/")
           :publishing-function org-publish-attachment)
          ("website" :components ("pub-org" "main-org"  "images"))))
;;;;
  (require 'ox-publish)
  (setq org-publish-use-timestamps-flag nil)
  (org-publish-project "website"))
