The urllib.request module defines functions and classes which help in opening URLs (mostly HTTP) in a complex world �� basic and digest authentication, redirections, cookies and more.

urllib.requestģ�鶨�庯����������Ը��ӵķ�ʽ��url������������ժҪ����֤���ض���cookie��������

For ftp, file, and data urls and requests explicity handled by legacy URLopener and FancyURLopener classes, this function returns a urllib.response.addinfourl object which can work as context manager and has methods such as

����ftp,file�� data url ��request���󽫱��̳е� URLopener �� FancyURLopener�������������������һ�� urllib.response.addinfourl ���󣬴˶�����Ϊһ�������Ĺ����������������Ұ������µĺ�����

with open( 'zhihu.html', 'wb' ) as f:
    f.write(str.encode(data))
