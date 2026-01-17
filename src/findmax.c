#include <stdio.h>

/* **Поиск максимального значения**:
   Функция принимает массив целых чисел
   и возвращает максимальное значение. */

int findMax(int arr[], int size) {
    int max = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > max) max = arr[i];
    }
    return max;
}

// Проверка корректности ввода целого числа
int read_int_simple(int *out) {
    char buf[64];
    if (!fgets(buf, sizeof(buf), stdin)) return 0; // EOF или ошибка ввода

    int val;
    char extra;
    int matched = sscanf(buf, " %d %c", &val, &extra);
    if (matched == 1) {
        *out = val;
        return 1;
    }

    // Некорректный ввод
    printf("Ошибка ввода: введите целое число\n");
    return 0;
}

int main() {
    int max, size;

    printf("Введите размер массива: ");
    if (read_int_simple(&size) == 0) {
        return 0;
    }

    int arr[size];

    for (int i = 0; i < size; i++) {
        printf("Введите элемент массива: ");
        if (read_int_simple(&arr[i]) == 0) {
            return 0;
        }
    }

    max = findMax(arr, size);
    printf("Максимальный элемент массива: %d\n", max);

    return 0;
}

