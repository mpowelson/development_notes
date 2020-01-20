#!/usr/bin/env sh

# Remove all existing alternatives
sudo update-alternatives --remove-all llvm
sudo update-alternatives --remove-all clang

# exit on first error
set -e

# To Install llvm/clang 6.0
sudo apt update
sudo apt install -y clang-6.0 llvm-6.0 lld-6.0 lldb-6.0
sudo apt install clang-{format,tidy,tools}-6.0 clang-6.0-doc clang-6.0-examples

# To Install llvm/clang 8.0
sudo apt update
sudo apt install -y clang-8 llvm-8 lld-8 lldb-8
sudo apt install clang-{format,tidy,tools}-8 clang-8-doc clang-8-examples

# llvm-6.0 and clang-6.0
sudo update-alternatives \
  --install /usr/lib/llvm              llvm             /usr/lib/llvm-6.0  70 \
  --slave   /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-6.0  \
	--slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-6.0 \
	--slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-6.0 \
	--slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-6.0 \
	--slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-6.0 \
	--slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-6.0 \
	--slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-6.0 \
	--slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-6.0 \
	--slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-6.0 \
	--slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-6.0 \
	--slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-6.0 \
	--slave   /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-6.0 \
	--slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-6.0 \
	--slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-6.0 \
	--slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-6.0 \
	--slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-6.0 \
	--slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-6.0 \
	--slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-6.0 \
	--slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-6.0 \
	--slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-6.0 \
	--slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-6.0

sudo update-alternatives \
  --install /usr/bin/clang                 clang                  /usr/bin/clang-6.0     70 \
  --slave   /usr/bin/clang++               clang++                /usr/bin/clang++-6.0 \
  --slave   /usr/bin/lld                   lld                    /usr/bin/lld-6.0 \
  --slave   /usr/bin/clang-format          clang-format           /usr/bin/clang-format-6.0  \
  --slave   /usr/bin/clang-tidy            clang-tidy             /usr/bin/clang-tidy-6.0  \
  --slave   /usr/bin/clang-tidy-diff.py    clang-tidy-diff.py     /usr/bin/clang-tidy-diff-6.0.py \
  --slave   /usr/bin/clang-include-fixer   clang-include-fixer    /usr/bin/clang-include-fixer-6.0 \
  --slave   /usr/bin/clang-offload-bundler clang-offload-bundler  /usr/bin/clang-offload-bundler-6.0 \
  --slave   /usr/bin/clangd                clangd                 /usr/bin/clangd-6.0 \
  --slave   /usr/bin/clang-check           clang-check            /usr/bin/clang-check-6.0 \
  --slave   /usr/bin/scan-view             scan-view              /usr/bin/scan-view-6.0 \
  --slave   /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-6.0 \
  --slave   /usr/bin/clang-query           clang-query            /usr/bin/clang-query-6.0 \
  --slave   /usr/bin/modularize            modularize             /usr/bin/modularize-6.0 \
  --slave   /usr/bin/sancov                sancov                 /usr/bin/sancov-6.0 \
  --slave   /usr/bin/c-index-test          c-index-test           /usr/bin/c-index-test-6.0 \
  --slave   /usr/bin/clang-reorder-fields  clang-reorder-fields   /usr/bin/clang-reorder-fields-6.0 \
  --slave   /usr/bin/clang-change-namespace clang-change-namespace  /usr/bin/clang-change-namespace-6.0 \
  --slave   /usr/bin/clang-import-test     clang-import-test      /usr/bin/clang-import-test-6.0 \
  --slave   /usr/bin/scan-build            scan-build             /usr/bin/scan-build-6.0 \
  --slave   /usr/bin/scan-build-py         scan-build-py          /usr/bin/scan-build-py-6.0 \
  --slave   /usr/bin/clang-cl              clang-cl               /usr/bin/clang-cl-6.0 \
  --slave   /usr/bin/clang-rename          clang-rename           /usr/bin/clang-rename-6.0 \
  --slave   /usr/bin/find-all-symbols      find-all-symbols       /usr/bin/find-all-symbols-6.0 \
  --slave   /usr/bin/lldb                  lldb                   /usr/bin/lldb-6.0 \
  --slave   /usr/bin/lldb-server           lldb-server            /usr/bin/lldb-server-6.0

# llvm-8.0 and clang-8.0
sudo update-alternatives \
  --install /usr/lib/llvm              llvm             /usr/lib/llvm-8  50 \
  --slave   /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-8  \
	--slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-8 \
	--slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-8 \
	--slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-8 \
	--slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-8 \
	--slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-8 \
	--slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-8 \
	--slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-8 \
	--slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-8 \
	--slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-8 \
	--slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-8 \
	--slave   /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-8 \
	--slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-8 \
	--slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-8 \
	--slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-8 \
	--slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-8 \
	--slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-8 \
	--slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-8 \
	--slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-8 \
	--slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-8 \
	--slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-8

sudo update-alternatives \
  --install /usr/bin/clang                 clang                  /usr/bin/clang-8     50 \
  --slave   /usr/bin/clang++               clang++                /usr/bin/clang++-8 \
  --slave   /usr/bin/lld                   lld                    /usr/bin/lld-8 \
  --slave   /usr/bin/clang-format          clang-format           /usr/bin/clang-format-8  \
  --slave   /usr/bin/clang-tidy            clang-tidy             /usr/bin/clang-tidy-8  \
  --slave   /usr/bin/clang-tidy-diff.py    clang-tidy-diff.py     /usr/bin/clang-tidy-diff-8.py \
  --slave   /usr/bin/clang-include-fixer   clang-include-fixer    /usr/bin/clang-include-fixer-8 \
  --slave   /usr/bin/clang-offload-bundler clang-offload-bundler  /usr/bin/clang-offload-bundler-8 \
  --slave   /usr/bin/clangd                clangd                 /usr/bin/clangd-8 \
  --slave   /usr/bin/clang-check           clang-check            /usr/bin/clang-check-8 \
  --slave   /usr/bin/scan-view             scan-view              /usr/bin/scan-view-8 \
  --slave   /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-8 \
  --slave   /usr/bin/clang-query           clang-query            /usr/bin/clang-query-8 \
  --slave   /usr/bin/modularize            modularize             /usr/bin/modularize-8 \
  --slave   /usr/bin/sancov                sancov                 /usr/bin/sancov-8 \
  --slave   /usr/bin/c-index-test          c-index-test           /usr/bin/c-index-test-8 \
  --slave   /usr/bin/clang-reorder-fields  clang-reorder-fields   /usr/bin/clang-reorder-fields-8 \
  --slave   /usr/bin/clang-change-namespace clang-change-namespace  /usr/bin/clang-change-namespace-8 \
  --slave   /usr/bin/clang-import-test     clang-import-test      /usr/bin/clang-import-test-8 \
  --slave   /usr/bin/scan-build            scan-build             /usr/bin/scan-build-8 \
  --slave   /usr/bin/scan-build-py         scan-build-py          /usr/bin/scan-build-py-8 \
  --slave   /usr/bin/clang-cl              clang-cl               /usr/bin/clang-cl-8 \
  --slave   /usr/bin/clang-rename          clang-rename           /usr/bin/clang-rename-8 \
  --slave   /usr/bin/find-all-symbols      find-all-symbols       /usr/bin/find-all-symbols-8 \
  --slave   /usr/bin/lldb                  lldb                   /usr/bin/lldb-8 \
  --slave   /usr/bin/lldb-server           lldb-server            /usr/bin/lldb-server-8

