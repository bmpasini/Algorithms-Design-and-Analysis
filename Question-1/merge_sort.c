#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* merging */
inline
void merge(int *left, int left_len, int *right, int right_len, int *out)
{
    int i, j,k;
    for ( i = j = k = 0; i < left_len && j < right_len; )
        out[k++] = left[i] < right[j] ? left[i++] : right[j++];

    while (i < left_len) out[k++] = left[i++];
    while (j < right_len) out[k++] = right[j++];
}

/* inner recursion */
void recur(int *buf, int *tmp, int len)
{
    int mid = len/2;
    if (len <= 1) return;

    /* buf and tmp are swapped*/
    recur(tmp, buf, mid);
    recur(tmp + mid, buf + mid, len - mid);

    merge(tmp, mid, tmp + mid, len - mid, buf);
}

/* preprocessing before recursion */
void merge_sort(int * buf, int len)
{
    /* call alloc, copy and free once */
    int *tmp = malloc(sizeof(int) * len);
    memcpy(tmp, buf, sizeof(int) * len);

    recur(buf, tmp, len);

    free(tmp);
}

/* main procedure to run merge sort on a randomly generate array of int */
int main()
{
#   define LEN 100000
    int i, x[LEN];

    for (i = 0; i < LEN; i++)
        x[i] = rand() % LEN;

    /* uncomment to see unsorted array */
    /** puts("before sort on %d integers:");
    for (i = 0; i < LEN; i++) printf("%d ", x[i]);
    putchar('\n');
    **/

    merge_sort(x, LEN);

    for (i = 0; i < LEN; i++) printf("%d ", x[i]);
    putchar('\n');
    puts("after sort on integers:");

    return 0;
}