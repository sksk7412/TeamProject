const node = $('#checkAll').get(0)
const checkboxes = $(':checkbox');
const warning = $('.warning');
const req = $(".req");

function checkVal(form) {
    if (checkboxes.get(1).checked && checkboxes.get(4).checked)
        form.submit();
    else {
        alert('필수항목에 동의해주세요.');
        for (let i = 0; i < warning.length; i++) {
            warning.show();
        }
    }
}
$('#checkAll').click(e => {
    if (node.checked) {
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes.get(i)
                .checked = true;
        }
    }
    else {
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes.get(i)
                .checked = false;
        }
    }
})