import os
import re
import shutil
from subprocess import Popen, PIPE

"""
Note: The default CoNLL 2006 eval script needs to be changed!
  In lines 476 and 480, change from the following:
476      @fields_g{'word', 'pos', 'head', 'dep'} = (split (/\s+/, $line_g))[1, 3, 6, 7] ;
  to:                                                                          ^
476      @fields_g{'word', 'pos', 'head', 'dep'} = (split (/\s+/, $line_g))[1, 4, 6, 7] ;
                                                                               ^
"""


folders = os.listdir('log')
for lang in sorted(folders):
    lang_path = os.path.join('log', lang)
    files = os.listdir(lang_path)
    # try:
    #     gold_path = os.path.join('data', 'conll2006', lang.capitalize(),
    #         [l for l in os.listdir(os.path.join('data', 'conll2006', lang.capitalize())) if 'test' in l][0])
    # except:
    #     continue
    for filename in sorted(files):
        basename = os.path.splitext(filename)[0]
        path = os.path.join('log', lang, filename)
        with open(path, 'r') as f: dump = f.read()
        try:
            uas, las, epoch = re.findall(
                r"Epoch 200.*?best test Wo.*?uas: ([0-9\.]+)%, las: ([0-9\.]+)%.*?\(epoch: (\d+)\)",
                dump, flags=re.DOTALL)[-1]
            uid = re.search(r"\*{3} Model UID: (.+?) \*{3}", dump, flags=re.DOTALL).group(1)
        except:
            continue
        epoch = int(epoch)
        print path, uid, uas, las, epoch

        gold_path = os.path.join('tmp', '%sgold_test%d' % (uid, epoch))
        pred_path = os.path.join('tmp', '%spred_test%d' % (uid, epoch))
        shutil.copy2(gold_path, os.path.join(lang_path, basename + '.gold'))
        shutil.copy2(pred_path, os.path.join(lang_path, basename + '.pred'))
        process = Popen(["perl", "data/conll2006/eval.pl", "-g", gold_path, "-s", pred_path], stdout=PIPE, stderr=PIPE)
        output, err = process.communicate()
        # print err
        real_las = re.search(r"Labeled   attachment score:.+?([0-9\.]+) %", output).group(1)
        real_uas = re.search(r"Unlabeled attachment score:.+?([0-9\.]+) %", output).group(1)
        print "UAS: %s, LAS: %s" % (real_uas, real_las)
        with open(os.path.join(lang_path, basename + '.analysis'), 'w') as f:
            f.write(output)
