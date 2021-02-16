# via https://gist.github.com/g00ntar/8109a31326b8f4a6dfcb643882701841
# see also https://github.com/bertonha/fish-posix-source
function posix-source
    for i in (cat $argv)
        set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
end
