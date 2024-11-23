//冒泡排序
//算法原理：执行n-1趟， 然后每趟比较 n-1次元素
//平均时间复杂度：0(n^2)
//最坏时间复杂度：0(n^2)
//最好时间复杂度：0(n)  如果第一次没有交换
//稳定性： 稳定排序
void parlllsort() {
  List<int> a = [6, 9, 1];
  //需要执行几趟
  for (int i = 0; i < a.length - 1; i++) {
    //一趟需要比较几次
    for (int j = i; j < a.length - 1; j++) {
      int temp;
      if (a[i] > a[j + 1]) {
        temp = a[i];
        a[i] = a[j + 1];
        a[j + 1] = temp;
      }
    }
  }
  print(a);
}

//选择排序
//算法原理：选择n-1次，每次选择，比较n-1
//平均时间复杂度：0(n^2)
//最坏时间复杂度：0(n^2)
//最好时间复杂度：0(n^2)
//稳定性： 不稳定排序

void selectSort() {
  List<int> a = [6, 9, 1];
  int temp;
  //选择次数
  for (int i = 0; i < a.length - 1; i++) {
    //比较次数
    for (int j = i; j < a.length - 1; j++) {
      if (a[i] < a[j + 1]) {
        temp = a[i];
        a[i] = a[j + 1];
        a[j + 1] = temp;
      }
    }
  }
  print(a);
}

//插入排序
//算法原理：分为排序，未排序的数据，然后把未排序的数据一一拆入排序列中
//平均时间复杂度：0(n^2)
//最坏时间复杂度：0(n^2)
//最好时间复杂度：0(n)
//稳定性： 稳定排序

void insertSort() {
  List<int> a = [6, 9, 1];
  //遍历待排序的数据，索引从1开始 ，a[0]被认为是已经排好的序列
  for (int i = 1; i < a.length; i++) {
    //当前插入元素
    int k = a[i];
    //已经排序的最后一个元素
    int j = i - 1;

    while (j >= 0 && a[j] > k) {
      //将大于k的元素往后移
      a[j + 1] = a[j];
      j--;
    }
    //插入到正确的位置
    a[j + 1] = k;
  }
  print(a);
}

//快速排序
//算法原理：1,选择基准，2，分区2个序列 3，对2个区递归
//平均时间复杂度：0(n^2)
//最坏时间复杂度：0(n^2)
//最好时间复杂度：0(n)
//稳定性： 稳定排序
void quickSort(List<int> a, int low, int hight) {
  if (low < hight) {
    int pivotIndex = partition(a, low, hight);
    quickSort(a, low, pivotIndex - 1);
    quickSort(a, pivotIndex + 1, hight);
  }
}

//分割， 把比基准值小的放前面
//基准值：为第一个元素，最后一个元素，随机值

int partition(List<int> a, int low, int hight) {
  int pivot = low;
  int i = low + 1;
  for (int j = i; j < hight; j++) {
    if (a[j] < a[pivot]) {
      swap(a, i, j);
      i++;
    }
  }
  swap(a, pivot, i - 1);
  return i;
}

void swap(List<int> a, int i, int j) {
  int temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}

void testquickSort() {
  List<int> arry = [4, 5, 6, 1, 2, 7, 9, 8];

  quickSort(arry, 0, arry.length);

  print(arry);
}

//归并排序
//思想：把数组分成2半,然后分别排序，最后合并成一个数组
//平均时间复杂度：0(nlogn)
//最坏时间复杂度：0(n^2)
//最好时间复杂度：0(n)
//稳定性： 稳定排序
void mergeSort(List<int> array, List<int> temp, int left, int right) {
  //如果数组元素只有一个
  if (left >= right) {
    return;
  }
  //计算中间点
  int mid = (left + right) ~/ 2;
  //左半部划分
  mergeSort(array, temp, left, mid);
  //右半部划分
  mergeSort(array, temp, mid + 1, right);
  //合并
  merge(array, temp, left, mid, right);
}

void merge(List<int> array, List<int> temp, int left, int mid, int right) {
  //标记左半区的第一个未排序的元素
  int lPos = left;
  //标记右半区的第一个未排序的元素
  int rPos = mid + 1;
  //临时数组的元素下表
  int pos = left;
  //合并
  while (lPos <= mid && rPos <= right) {
    if (array[lPos] < array[rPos]) {
      temp[pos++] = array[lPos++];
    } else {
      temp[pos++] = array[rPos++];
    }
  }
  //合并左半区未排序的元素
  while (lPos <= mid) {
    temp[pos++] = array[lPos++];
  }
  //合并右半区未排序的元素
  while (rPos <= right) {
    temp[pos++] = array[rPos++];
  }

  //赋值给原来数组
  while (left <= right) {
    array[left] = temp[left];
    left++;
  }
}

void testMergeSort() {
  var array = <int>[9, 7, 8, 1, 2, 3, 4, 6, 5];
  List<int> temp = List.filled(9, -1);
  mergeSort(array, temp, 0, array.length - 1);
  print(array);
}

//希尔排序
//算法原理：一个增量序列，然后依次递减，每个子序列，采用插入排序
//平均时间复杂度：0(nlogn)
//最坏时间复杂度：0(nlog^2n)
//最好时间复杂度：0(n)
//稳定性： 不稳定稳定排序
void shellSort(List<int> array, int n) {
  int i, j, inc, key;
  //计算增量，初始增量为：n/2, 后面每趟除以 2
  for (inc = n ~/ 2; inc > 0; inc = inc ~/ 2) {
    //每一堂采用拆入排序
    for (i = inc; i < n; i++) {
      //待插入的元素
      key = array[i];
      for (j = i; j >= inc && key < array[j - inc]; j = j - inc) {
        array[j] = array[j - inc];
      }
      array[j] = key;
    }
    print(array);

  }
}

void testShellSort() {
  List<int> array = [6, 8, 4, 1, 3, 5, 2, 7];
  shellSort(array, 8);
  print(array);
}
