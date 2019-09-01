import yaml
import matplotlib.pyplot as plt

from bicycleparameters.parameter_sets import PrincipalParameterSet

speeds = [3, 5, 7, 9]

fig, axes = plt.subplots(nrows=3, ncols=2)

axes[0, 1].axis('off')


def plot(par_set, ax):
    par_set.plot_mass_centers(ax=ax)
    par_set.plot_principal_radii_of_gyration(ax=ax)
    par_set.plot_person_diamond(ax=ax)
    par_set.plot_geometry(ax=ax)
    return ax

with open('data/principal-browserjason.yml', 'r') as f:
    par_dict = yaml.load(f)['values']
    par_set = PrincipalParameterSet(par_dict)
    plot(par_set, axes[0, 0])
    axes[0, 0].set_title('Reference')

for ax, speed in zip(axes.flatten()[2:], speeds):

    tail = 'a' if speed == 3 else 'best'

    with open('data/principal-extended{}{}.yml'.format(speed, tail), 'r') as f:
        par_dict = yaml.load(f)['values']

    par_set = PrincipalParameterSet(par_dict)
    plot(par_set, ax)
    ax.set_title('{} m/s Design Speed'.format(speed))

width = 6.0
fig.set_size_inches((width, 4/3*width))
fig.tight_layout()
fig.savefig('figures/optimal-geometries.png', dpi=300)


for speed in speeds:

    fig, ax = plt.subplots()
    tail = 'a' if speed == 3 else 'best'

    with open('data/principal-extended{}{}.yml'.format(speed, tail), 'r') as f:
        par_dict = yaml.load(f)['values']

    par_set = PrincipalParameterSet(par_dict)
    par_set.plot_all(ax=ax)
    ax.set_title('{} m/s Design Speed'.format(speed))
    fig.savefig('figures/optimal-geometry-{}.png'.format(speed), dpi=300)
