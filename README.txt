List::Javascriptishについて

PerlのArrayを拡張し、JavaScriptのArrayで定義されているメソッドを
利用可能にするモジュールです。

yappoさんのList::Rubyishを元にした習作になります。
http://search.cpan.org/~yappo/List-Rubyish-0.03/lib/List/Rubyish.pm

コンストラクタ、push、shiftなどはList::Rubyishのメソッドを借用し、
sort、reverseなど、JavaScriptで破壊的なメソッドとして定義されているものは書き直しています。
spliceは完全オリジナルで書き下ろしています。

test.plをperl5.10以上の環境で実行していただければ
動作をご確認いただけます。

よろしくお願いいたします。

iskata on 2010.2.17
