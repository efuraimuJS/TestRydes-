# Pin npm packages by running ./bin/importmap
pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js", preload: true
pin "jquery-ui", to: "https://ga.jspm.io/npm:jquery-ui@1.13.2/ui/widget.js", preload: true
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.2/dist/js/bootstrap.esm.js", preload: true
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers", preload: true
pin_all_from "app/javascript/custom", under: "custom", preload: true
