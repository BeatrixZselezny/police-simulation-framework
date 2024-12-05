import plotly.express as px
import pandas as pd

# Példaadat
data = {
    'month': ['2024-09', '2024-10', '2024-11', '2024-12'],
    'Hacking': [6, 0, 0, 0],
    'Human Trafficking': [6, 0, 0, 0],
    'Burglary': [0, 6, 0, 0],
    'Drug Dealing': [0, 6, 0, 0],
    'Fraud': [0, 0, 7, 0],
    'Assault': [0, 0, 0, 1],
    'Robbery': [0, 0, 0, 8]
}
df = pd.DataFrame(data)

# Átalakítás hosszú formátumú adatra
df_long = pd.melt(df, id_vars=['month'], var_name='type', value_name='count')

# Interaktív diagram létrehozása
fig = px.bar(df_long, x='month', y='count', color='type', barmode='group', title='Monthly Crime Types Distribution')
fig.show()
