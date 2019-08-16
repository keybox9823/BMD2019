import yaml
import matplotlib.pyplot as plt

from bicycleparameters.parameter_sets import PrincipalParameterSet

speeds = [3, 5, 7, 9]

fig, axes = plt.subplots(nrows=3, ncols=len(speeds)+1, sharey=True,
                         gridspec_kw={'width_ratios': [1, 2, 1.5, 1.5, 4]})

with open('data/principal-browserjason.yml', 'r') as f:
    par_dict = yaml.load(f)['values']
    par_set = PrincipalParameterSet(par_dict)
    par_set.plot_all(ax=axes[0])
    axes[0].set_title('Reference')

for ax, speed in zip(axes[1:], speeds):

    tail = 'a' if speed == 3 else 'best'

    with open('data/principal-extended{}{}.yml'.format(speed, tail), 'r') as f:
        par_dict = yaml.load(f)['values']

    par_set = PrincipalParameterSet(par_dict)
    #par_set.plot_geometry(ax=ax)
    par_set.plot_all(ax=ax)
    #ax.set_aspect('equal')
    ax.set_title('{} m/s'.format(speed))
    ax.set_ylabel('')

width = 12.0
fig.set_size_inches((width, 500/1900*width))
fig.tight_layout()
fig.savefig('figures/optimal-geometries.png', dpi=300)
