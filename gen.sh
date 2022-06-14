begin(){
	echo '\\documentclass{article}' >> main.tex
	echo '\\usepackage{CJKutf8} % 中文' >> main.tex
	echo '\\usepackage[table]{xcolor} % 表格颜色' >> main.tex
	echo '\\usepackage{array}' >> main.tex
	echo '\\newcolumntype{L}[1]{>{\\raggedright\\let\\newline\\\\\\arraybackslash\\hspace{0pt}}m{#1}} % 表格对齐' >> main.tex
	echo '\\begin{document}' >> main.tex
	echo '\\setlength{\\parindent}{0pt}' >> main.tex
	echo '\\begin{CJK}{UTF8}{gbsn}' >> main.tex
}

title() {
	echo '\\begin{center}' >> main.tex
	echo '\\section*{title}' >> main.tex
	echo '时间限制：1s\\\\' >> main.tex
	echo '空间限制：256M\\\\' >> main.tex
	echo '输入：标准输入\\\\' >> main.tex
	echo '输出：标准输出' >> main.tex
	echo '\\end{center}' >> main.tex
}

subsection() {
	echo "\\subsection*{$1}" >> main.tex
	echo "$1在这！" >> main.tex
}

sample() { # {{{
	echo '\\subsection*{样例}' >> main.tex
	echo '' >> main.tex
	echo '\\begin{tabular}{|L{11.5cm}|}' >> main.tex
	echo '\\hline' >> main.tex
	echo '输入\\\\' >> main.tex
	echo '\\hline' >> main.tex
	echo '\\rowcolor{gray!20} 3\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 3 1\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 1 2 1\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 4 5\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 3 3 5 2\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 5 16\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 1 2 3 4 5\\\\' >> main.tex
	echo '\\hline' >> main.tex
	echo '输出\\\\' >> main.tex
	echo '\\hline' >> main.tex
	echo '\\rowcolor{gray!20} 3\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 8\\\\' >> main.tex
	echo '\\rowcolor{gray!20} 0\\\\' >> main.tex
	echo '\\hline' >> main.tex
	echo '\\end{tabular}' >> main.tex
} # }}}

question() {
	title
	echo '题目描述' >> main.tex
	subsection 输入
	subsection 输出
	sample
	subsection 说明
	echo '\\newpage' >> main.tex
}

end() {
	echo '\\end{CJK}' >> main.tex
	echo '\\end{document}' >> main.tex
}

if [ $# -eq 2 ]; then
	mkdir $1
	cd $1
	begin
	for (( c=1; c<=$2; c++ ))
	do 
		question
	done
	end
else
	echo "Err! usage: ./gen.sh dir_name question_number"
fi
