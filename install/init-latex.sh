#!/usr/bin/env bash

init-latex() {
    opts="-a -p -q -r"
    if [[ "$#" -eq 1 ]] && [[ "$opts" =~ "$1" ]]; then
        CWD=$(pwd)
        # Steps to initialize Assignment environment
        if [[ $1 = "-a" ]]; then
            mkdir report && cd report
            cp -R ${LTA}/Figures Figures
            cp ${LTA}/main.tex report.tex
            ln -s ${LTA}/structure.tex structure.tex
            ln -s ${LTA}/luftballons.pl luftballons.pl
            echo "LateX Assignment environment initialized at : ${CWD}"
        fi
        # Steps to initialize Project environment (TODO)
        # Steps to initialize QnA environment
        if [[ $1 = "-q" ]]; then
            mkdir QnA && cd QnA
            cp -R ${LTQ}/*jpg .
            cp ${LTQ}/student_template.tex qna.tex
            ln -s ${LTQ}/structure.tex structure.tex
            ln -s ${LTQ}/luftballons.pl luftballons.pl
            echo "LateX QnA environment initialized at: ${CWD}"
        fi
        # Steps to initialize Resume environment (TOD)
        ln -s ${LT}/uoft.png uoft.png
        cd ..
    else
        echo "Utility to initialize a latex working environment with standardized task templates"
        echo
        echo "Syntax: init-latex [-a|p|q|r]"
        echo "options:"
        echo -e "a\tInit environment for assignments"
        echo -e "p\tInit environment for projects"
        echo -e "q\tInit environment for qnas"
        echo -e "r\tInit environment for resume"
    fi
}