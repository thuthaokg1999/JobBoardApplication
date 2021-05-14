function openRecentCards() {
    document.getElementById('recentArea').style.display = 'block';
    document.getElementById('fulltimeArea').style.display = 'none';
    document.getElementById('parttimeArea').style.display = 'none';
    document.getElementById('internArea').style.display = 'none';

    document.getElementById('nav-recent').style.borderBottom = '3px solid red';
    document.getElementById('nav-fulltime').style.border = 'none';
    document.getElementById('nav-parttime').style.border = 'none';
    document.getElementById('nav-intern').style.border = 'none';
}

function openFullTimeCards() {
    document.getElementById('fulltimeArea').style.display = 'block';
    document.getElementById('recentArea').style.display = 'none';
    document.getElementById('parttimeArea').style.display = 'none';
    document.getElementById('internArea').style.display = 'none';

    document.getElementById('nav-fulltime').style.borderBottom = '3px solid red';
    document.getElementById('nav-recent').style.border = 'none';
    document.getElementById('nav-parttime').style.border = 'none';
    document.getElementById('nav-intern').style.border = 'none';
}

function openPartTimeCards() {
    document.getElementById('parttimeArea').style.display = 'block';
    document.getElementById('recentArea').style.display = 'none';
    document.getElementById('fulltimeArea').style.display = 'none';
    document.getElementById('internArea').style.display = 'none';

    document.getElementById('nav-parttime').style.borderBottom = '3px solid red';
    document.getElementById('nav-recent').style.border = 'none';
    document.getElementById('nav-fulltime').style.border = 'none';
    document.getElementById('nav-intern').style.border = 'none';
}

function openInternCards() {
    document.getElementById('internArea').style.display = 'block';
    document.getElementById('recentArea').style.display = 'none';
    document.getElementById('fulltimeArea').style.display = 'none';
    document.getElementById('parttimeArea').style.display = 'none';

    document.getElementById('nav-intern').style.borderBottom = '3px solid red';
    document.getElementById('nav-recent').style.border = 'none';
    document.getElementById('nav-fulltime').style.border = 'none';
    document.getElementById('nav-parttime').style.border = 'none';
}

function btnFulltime() {
    document.getElementById('fulltimeArea').style.display = 'block';
    document.getElementById('recentArea').style.display = 'none';
    document.getElementById('parttimeArea').style.display = 'none';
    document.getElementById('internArea').style.display = 'none';
}

function btnParttime() {
    document.getElementById('parttimeArea').style.display = 'block';
    document.getElementById('recentArea').style.display = 'none';
    document.getElementById('fulltimeArea').style.display = 'none';
    document.getElementById('internArea').style.display = 'none';
}

function btnIntern() {
    document.getElementById('internArea').style.display = 'block';
    document.getElementById('recentArea').style.display = 'none';
    document.getElementById('fulltimeArea').style.display = 'none';
    document.getElementById('parttimeArea').style.display = 'none';
}

//POST

function displayRequest() {
    var req = document.getElementById('requestContent').value,
            listNote = document.getElementById('list'),
            liNote = document.createElement("LI"),
            txtNote = document.createTextNode(req);

    liNote.appendChild(txtNote);
    listNote.appendChild(liNote);
}