After install jupyter notebook and matplotlib, I got this error:
```
ImportError: No module named matplotlib.pyplot
```

I tried to install matplotlib again, but it didn't work.
I try these commands:
```
pip install --upgrade matplotlib
pip install --upgrade pip
```

Finally, This works for me:
```
pip install -U jupyter
```