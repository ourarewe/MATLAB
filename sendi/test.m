clc;clear;

dc = csvread('cpu_value.csv');
dd = csvread('disk_value.csv');
dm = csvread('mem_value.csv');
dp = csvread('partition_value.csv');
ds = csvread('swap_value.csv');

z=1./(dc.+0.001)+1./(dd.+0.001)+1./(dm+0.001)+1./(dp+0.001)+1./(ds+0.001)

s=1/(1+e^(z))
