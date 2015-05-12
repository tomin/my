var eventdays = [
    new Date(2014, 8, 7, 21),
    new Date(2014, 8, 14, 21),
    new Date(2014, 8, 21, 21),
    new Date(new Date().getFullYear() +1, 0, 1) //final fall back
];
function loop(array, callback) {
    for(var i= 0, len=array.length; i<len; i++) {
        callback(array[i]);
    }
}
loop(eventdays, function(target){
});