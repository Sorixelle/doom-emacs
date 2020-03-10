;;; lang/dart/config.el -*- lexical-binding: t; -*-

(after! dart-mode
  (when (featurep! +lsp)
    (add-hook 'dart-mode-local-vars-hook #'lsp!)
    (when (and (featurep! +flutter) IS-LINUX)
      (when-let (path (doom-glob "/opt/flutter/bin/cache/dart-sdk/"))
        (setq lsp-dart-sdk-dir path)))))


(use-package! flutter
  :defer t
  :when (featurep! +flutter)
  :config
  (map! :map dart-mode-map
        :localleader
        "r" #'flutter-run-or-hot-reload))
