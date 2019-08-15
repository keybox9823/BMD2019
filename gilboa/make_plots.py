import yaml
import numpy as np
import matplotlib.pyplot as plt

from bicycleparameters.parameter_sets import BenchmarkParameterSet
from bicycleparameters.models import MinimalLinearWhippleCarvalloModel

with open('data/benchmark-benchmark.yml', 'r') as f:
    benchmark_benchmark = yaml.load(f)['values']

with open('data/benchmark-pistarider.yml', 'r') as f:
    benchmark_pista = yaml.load(f)['values']

with open('data/benchmark-pistarideroptimized3ms.yml', 'r') as f:
    benchmark_target = yaml.load(f)['values']

with open('data/benchmark-realizedopttwo.yml', 'r') as f:
    benchmark_realized = yaml.load(f)['values']


pset = BenchmarkParameterSet(benchmark_benchmark, True)

speeds = np.linspace(0, 10, num=100)

# Eigenvalues vs speed of the Pista + Rider
pset = BenchmarkParameterSet(benchmark_pista, True)
model = MinimalLinearWhippleCarvalloModel(pset)
fig, ax = plt.subplots()
model.plot_eigenvalue_parts(v=speeds, ax=ax)
ax.set_title('Bianchi Pista')
w, h = fig.get_size_inches()
fig.set_size_inches((6.0, h/w*6.0))
fig.tight_layout()
fig.savefig('figures/pista-eig-vs-speed.png', dpi=300)

# Eigenvalues vs speed of the target bicycle + rider
pset = BenchmarkParameterSet(benchmark_target, True)
model = MinimalLinearWhippleCarvalloModel(pset)
fig, ax = plt.subplots()
model.plot_eigenvalue_parts(v=speeds, ax=ax)
ax.set_title('Target Design')
w, h = fig.get_size_inches()
fig.set_size_inches((6.0, h/w*6.0))
fig.tight_layout()
fig.savefig('figures/target-eig-vs-speed.png', dpi=300)

# Eigenvalues vs speed of the realized bicycle + rider
pset = BenchmarkParameterSet(benchmark_realized, True)
model = MinimalLinearWhippleCarvalloModel(pset)
fig, ax = plt.subplots()
model.plot_eigenvalue_parts(v=speeds, ax=ax)
ax.set_title('Realized Design')
w, h = fig.get_size_inches()
fig.set_size_inches((6.0, h/w*6.0))
fig.tight_layout()
fig.savefig('figures/realized-eig-vs-speed.png', dpi=300)

# Geometry of the target bicycle + rider
pset = BenchmarkParameterSet(benchmark_target, True)
fig, ax = plt.subplots()
ax.set_ylim((0.1, -1.5))
ax = pset.plot_principal_radii_of_gyration(ax=ax)
ax = pset.plot_principal_inertia_ellipsoids(ax=ax)
ax = pset.plot_geometry(ax=ax)
ax = pset.plot_mass_centers(ax=ax)
ax.set_xlabel(r'$x$ [m]')
ax.set_ylabel(r'$z$ [m]')
ax.set_title('Target Design')
w_des = 6.0
w, h = fig.get_size_inches()
fig.set_size_inches((w_des, h/w*w_des))
fig.tight_layout()
fig.savefig('figures/target-geometry.png', dpi=300)

# Geometry of the realized bicycle + rider
pset = BenchmarkParameterSet(benchmark_realized, True)
fig, ax = plt.subplots()
ax.set_ylim((0.1, -1.5))
ax = pset.plot_principal_radii_of_gyration(ax=ax)
ax = pset.plot_principal_inertia_ellipsoids(ax=ax)
ax = pset.plot_geometry(ax=ax)
ax = pset.plot_mass_centers(ax=ax)
ax.set_xlabel(r'$x$ [m]')
ax.set_ylabel(r'$z$ [m]')
ax.set_title('Realized Design')
w_des = 6.0
w, h = fig.get_size_inches()
fig.set_size_inches((w_des, h/w*w_des))
fig.tight_layout()
fig.savefig('figures/realized-geometry.png', dpi=300, transparent=True)
