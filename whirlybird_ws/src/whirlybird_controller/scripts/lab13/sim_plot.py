import matplotlib.pyplot as plt 
from matplotlib.lines import Line2D
import numpy as np
import param as P 


class plotGenerator:
    ''' The purpose of this class is to organize multiple plots in one
        figure using subplots.The plots will be organized in n x m 
        dimensions in the figure; where n represents the number of rows, 
        and m represents the number of columns. Ex, a subplot with 
        dimensions 3 x 2 will hold 6 plots. 3 plots per row, and 2 plots 
        per column. 

        Not every plot needs to be used. Ex, if you were to plot only 
        5 plots, you would still need dimensions 3 x 2 and one of the 
        plots would never be populated.'''

    # You only need to modify the code inside '#'s as shown below.
    ##################################################################
    #                       CODE TO BE MODIFIED
    ##################################################################
    def __init__(self):
        #SECTION 1
        ##############################################################
        # Number of subplots = num_of_rows*num_of_cols
        self.num_of_rows = 2    # Number of subplot rows
        self.num_of_cols = 2    # Number of subplot columns
        ##############################################################

        # Crete figure and axes handles
        self.fig, self.ax = plt.subplots(self.num_of_rows, 
            self.num_of_cols, sharex=True) 

        # A list to hold the time history
        self.time_history = [] 

        # The list type variable will store your plot objects
        self.handle = [] 

        ''' Create the handles below.
            The class plotGenerator inherits the class myPlot, and 
            organizes one or more instances of myPlot in a figure. The 
            myPlot class organizes one or more line objects in a single 
            axes. The syntax for myPlot is

            myPlot(axes,gain,xlabel,ylable,etc)

            To see a full description of myPlot, read the comments located 
            in the class myPlot. However, note that all arguments have 
            default values except the axes argument. 
            (i.e., A myPlot object could easily be created by

            myPlot(self.ax[0])

            The class myPlot also supports pass-by-reference and 
            pass-by-name. Examples are given below.

            self.handle.append(myPlot(self.ax[0],2,'xlabel','ylabel',
                               'title'))
            self.handle.append(myPlot(self.ax[1],180.0/np.pi,
                               title="y_r/y")
            self.handle.append(myPlot(self.ax[2],1,title="Force",
                               legend=("Force","Torque"))

            The myPlot class also comes with default line and color 
            styles. You can either specify the line or color styles 
            that you want when creating the myPlot object or you can 
            modify the default values that are contained within the 
            myPlot class.
            '''
        # Section 2
        ####################################################################
        self.handle.append(myPlot(self.ax[0,0],180.0/np.pi,'t(s)', 'deg', 
                                 'theta_r/theta'))
        self.handle.append(myPlot(self.ax[0,1],180.0/np.pi,'t(s)', 'deg', 
                                 'psi'))
        self.handle.append(myPlot(self.ax[1,0],180.0/np.pi,'t(s)', 'deg', 
                                 'phi_r/phi'))
        self.handle.append(myPlot(self.ax[1,1],P.km,'t(s)','Nm','force',legend=('fl','fr')))
        ####################################################################
        

    # Update the history
    def updateDataHistory(self,new_t, new_data):

        """
            This function updates the data history of all the plots.
            - new_t: The current simulation time.
            - new_data: Is a list of data lists for each plot. The 
                        order of the data must be the same order in which
                        the classes myPlot were created. 

            Ex: There are two subplots. Instantiated as shown below

                self.handle.append(myPlot(self.ax[0],180.0/np.pi,
                                  't(s)', 'deg','theta_r/theta'))

                self.handle.append(myPlot(self.ax[1],1,'t(s)',
                                  'Nm','torque'))

            The first subplot plots theta_r and theta and the second subplot
            plots Torque. Since this is the order in which the myPlot 
            classes were appended to the handle list, this is the order
            in which the data must be passed.

            Continuing the example:

            new_data = [[theta_r,theta],[torque]]

            Notice that new_data is a list of lists. The first inner list
            contains the data meant for the first plot, and the second 
            inner list is meant for the second plot.
       
    
            """
            
        # Add the new time data
        self.time_history.append(new_t)

        # Update all other data
        for i in range(len(self.handle)):
            self.handle[i].updateHistory(new_data[i])

    # Renders the data to the plots
    def update_plots(self):
        for i in range(len(self.handle)):
            self.handle[i].update_plot(self.time_history)




class myPlot:
    ''' This class organizes one or more line objects on one axes'''

    def __init__(self, ax, gain = 1,xlabel = 'x-axis', 
                 ylabel = 'y-axis',title = 'title', 
                 colors = ['b','r','g','c','m','y','b'], 
                 line_styles = ['-','--','-.',':'], 
                 legend = None, grid = True):

        ''' ax - This is a handle to the an axes of the figure
            gain - a scalar variable used on the data. This can be used 
                        to convert between units. Ex. to convert from 
                        radians to degrees, the gain should be 180/np.pi
            colors - Indicates the line color. If there are multiple lines,
                     colors can be a list of different colors. Below is a 
                     list of options. Note that they are strings.

                    'b' - blue
                    'g' - green
                    'r' - red
                    'c' - cyan
                    'm' - magenta
                    'y' - yellow
                    'k' - black

            line_style - Indicates the line style. If there are multiple
                     lines, line_style can be a list of different line 
                     styles. Below is a list of options. Note that they
                     are strings.

                     '-'  - solid line
                     '--' - dashed line
                     '-.' - dash_dot
                     ':'  - dotted line

            legend - A tuple of strings that identify the data. 
                     EX: ("data1","data2", ... , "dataN")

            xlable - Label of the x-axis
            ylable - Label of the y-axis
            title - Plot title
            gird - Indicates if a grid is to be overlapped on the plot
        '''


        self.legend = legend
        self.data_history = []        # Will contain the data history
        self.ax = ax                  # Axes handle
        self.gain = gain              # The scales the data
        self.colors = colors          # A list of colors. 
                                      # The first color in the list
                                      # corresponds to the first line
                                      # object.
        self.line_styles=line_styles  # A list of line styles.
                                      # The first line style in the list
                                      # corresponds to the first line 
                                      # object.
        self.line = []

        # Configure the axes
        self.ax.set_ylabel(ylabel)
        self.ax.set_xlabel(xlabel)
        self.ax.set_title(title)
        self.ax.grid(grid)


        # Keeps track of initialization
        self.init = True   


    # Adds the new data to the data history list after 
    # scaling it by the gain.
    def updateHistory(self,new_data):
        # new_data: a list containing the new data.
        # Ex: new_data = [theta_r, theta]
        self.data_history.append([t*self.gain for t in new_data])

    def update_plot(self,time_history):

        # If it is being initialized
        if self.init == True:

            # size contains the number of line objects to create
            size = len(self.data_history[0])

            for i in range(size):
                # zip rearranges the list
                data = zip(*self.data_history)

                # Instantiate line object and add it to the axes
                self.line.append(Line2D(time_history,data[i], 
                    color = self.colors[np.mod(i,len(self.colors)-1)], 
                    ls = self.line_styles[np.mod(i,len(self.line_styles)-1)],
                    label = self.legend[i] if self.legend != None else None))

                self.ax.add_line(self.line[i])

            self.init = False
            if self.legend != None:
                plt.legend(handles=self.line)
        else: # Add new data to the plot

            # zip rearranges the list
            data = zip(*self.data_history)

            # Updates the x and y data of each line.
            for i in range(len(self.line)):
                self.line[i].set_xdata(time_history)
                self.line[i].set_ydata(data[i])

        # Adjusts the axis to fit all of the data.        
        self.ax.relim()
        self.ax.autoscale()
           

