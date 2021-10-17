
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract taskList {

    uint32 public timestamp;
    mapping(int8 => task) base; //переменная состояния, в которой хранится база о задачах

    struct task {
        uint32 timestamp;
        string task;
        bool flag;
    }
 //   task[] public tasks; //создаем массив задач 
    task[] public tasks; // массив задач по названию

 /*   function newTask (base key, uint32 timestamp, string task, bool flag) public { //функция добавления задачи
        tasks.push(key, timestamp, task, flag);
    }*/
    function newTask1 (string task) public { //функция добавления задачи
        tasks.push(tasks);
    }

    function getNumberOfOpenTasks(bool flag) public pure returns (int){ //функция получения открытых задач
        int id;
        for(uint i = 0; i < tasks.length; i++) {
            if (flag == true){
                id ++;
            }
            return id;
        }
    }

    function getTaskList (string[] task) public { // функция получения списка задач
        for(uint i = 0; i < tasks.length; i++){
            task[i];
        }
    }

    function getKeyTask(string[] task) public { //получение задачи по ключу
        for(uint i = 0; i < tasks.length; i++){
            if(base == task[i]) {
                task[i];
            }
        }
    }
    function getKeyTask(string[] task) public { //удаление задачи по ключу
        for(uint i = 0; i < tasks.length; i++){
            if(base == task[i]) {
                delete task[i];
            }
        }
    }

    function getNumberOfCloseTasks(string[] task, bool flag) public { //функция выполненной задачи по ключу
        for(uint i = 0; i < tasks.length; i++) {
            if (base == task[i]){
                flag == false;
            }
        }
    }

    //task myTask = task(12.00, "Сomplete task number 1", true);
    
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }
    

    // Updates variable `timestamp` with current blockchain time.
    function touch() external {
        // Each function that accepts external message must check that
        // message is correctly signed.
        require(msg.pubkey() == tvm.pubkey(), 102);
        // Tells to the TVM that we accept this message.
        tvm.accept();
        // Update timestamp
        timestamp = now;
    }
}
