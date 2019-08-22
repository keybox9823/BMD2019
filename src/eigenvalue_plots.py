import yaml
import numpy as np
import matplotlib.pyplot as plt

from bicycleparameters.parameter_sets import PrincipalParameterSet
from bicycleparameters.models import MinimalLinearWhippleCarvalloModel

speeds = [3, 5, 7, 9]
speed_range = np.linspace(0, 10, num=500)

fig, axes = plt.subplots(nrows=3, ncols=2)

with open('data/principal-browserjason.yml', 'r') as f:
    par_dict = yaml.load(f)['values']
    par_set = PrincipalParameterSet(par_dict)
    ben_par_set = par_set.to_benchmark()
    model = MinimalLinearWhippleCarvalloModel(ben_par_set)
    model.plot_eigenvalue_parts(v=speed_range, ax=axes[0, 0])
    axes[0, 0].set_ylim((-10, 10))
    axes[0, 0].set_title('Reference')

for ax, speed in zip(axes.flatten()[2:], speeds):

    tail = 'a' if speed == 3 else 'best'

    with open('data/principal-extended{}{}.yml'.format(speed, tail), 'r') as f:
        par_dict = yaml.load(f)['values']

    par_set = PrincipalParameterSet(par_dict)
    ben_par_set = par_set.to_benchmark()
    model = MinimalLinearWhippleCarvalloModel(ben_par_set)
    model.plot_eigenvalue_parts(v=speed_range, ax=ax)
    ax.axvline(speed, color='black', linestyle='--')
    ax.set_title('{} m/s'.format(speed))
    ax.set_ylim((-10, 10))
    ax.set_ylabel('')

width = 8.0
fig.set_size_inches((width, 4/3*width))
fig.tight_layout()
fig.savefig('figures/optimal-eigenvalues.png', dpi=300)
